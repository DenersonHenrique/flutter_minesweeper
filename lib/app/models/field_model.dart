import 'explosion_exception.dart';

class FieldModel {
  final int row;
  final int column;
  bool _open = false;
  bool _mined = false;
  bool _checked = false;
  bool _exploded = false;
  final List<FieldModel> neighbors = [];

  FieldModel({
    required this.row,
    required this.column,
  });

  bool get open => _open;
  bool get mined => _mined;
  bool get checked => _checked;
  bool get exploded => _exploded;
  void undermine() => _mined = true;
  void changeChecked() => _checked = !_checked;
  bool get neighborhoodSecure => neighbors.every((element) => !element._mined);
  int get quantityMinesInTheNeighborhood =>
      neighbors.where((element) => element.mined).length;

  void addNeighbor(FieldModel neighbor) {
    final deltaRow = (row - neighbor.row).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaRow == 0 && deltaColumn == 0) return;

    if (deltaRow <= 1 && deltaColumn <= 1) neighbors.add(neighbor);
  }

  void toOpen() {
    if (_open) return;

    _open = true;

    if (_mined) {
      _exploded = true;
      throw ExplosionException();
    }

    if (neighborhoodSecure) {
      for (var element in neighbors) {
        element.toOpen();
      }
    }
  }

  void revelMineBombs() {
    if (_mined) _open = true;
  }

  void restart() {
    _open = false;
    _mined = false;
    _checked = false;
    _exploded = false;
  }

  bool get resolved {
    bool secureAndOpen = !mined && open;
    bool minedAndChecked = mined && checked;
    return minedAndChecked || secureAndOpen;
  }
}
