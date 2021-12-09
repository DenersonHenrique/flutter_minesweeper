import 'package:flutter_minesweeper/app/models/explosion_exception.dart';

class FieldModel {
  final int row;
  final int column;
  final List<FieldModel> neighbors = [];

  bool _open = false;
  bool _checked = false;
  bool _mined = false;
  bool _exploded = false;

  FieldModel({
    required this.row,
    required this.column,
  });

  bool get open => _open;
  bool get mined => _mined;
  bool get checked => _checked;
  bool get exploded => _exploded;
  void underMine() => _mined = true;
  void changeChecked() => _mined = !mined;
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

    if (neighborhoodSecure) neighbors.forEach((element) => element.toOpen());
  }

  void revelMines() {
    if (_mined) {
      _open = true;
    }
  }

  void restart() {
    _open = false;
    _checked = false;
    _mined = false;
    _exploded = false;
  }

  bool get resolved {
    bool minedAndChecked = mined && checked;
    bool secureAndOpen = !mined && open;
    return minedAndChecked || secureAndOpen;
  }
}
