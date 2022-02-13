import 'dart:math';
import 'field_model.dart';

class BoardModel {
  final int rows;
  final int columns;
  final int minesQuantity;
  final List<FieldModel> _fields = [];

  List<FieldModel> get fields => _fields;
  bool get resolved => _fields.every((element) => element.resolved);

  BoardModel({
    required this.rows,
    required this.columns,
    required this.minesQuantity,
  }) {
    _createFields();
    _toRelateNeighbors();
    _sortMines();
  }

  void restart() {
    for (var element in _fields) {
      element.restart();
    }
    _sortMines();
  }

  void toRevelMines() {
    for (var element in _fields) {
      element.revelMineBombs();
    }
  }

  void _createFields() {
    for (int row = 0; row < rows; row++) {
      for (int column = 0; column < columns; column++) {
        _fields.add(FieldModel(row: row, column: column));
      }
    }
  }

  void _toRelateNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addNeighbor(neighbor);
      }
    }
  }

  void _sortMines() {
    int sorted = 0;

    if (minesQuantity > rows * columns) return;

    while (sorted < minesQuantity) {
      int index = Random().nextInt(_fields.length);
      if (!_fields[index].mined) {
        sorted++;
        _fields[index].undermine();
      }
    }
  }
}
