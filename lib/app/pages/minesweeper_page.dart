import 'package:flutter/material.dart';
import 'package:flutter_minesweeper/app/models/field_model.dart';
import 'package:flutter_minesweeper/app/models/explosion_exception.dart';
import 'package:flutter_minesweeper/app/common/widgets/field_widget.dart';
import 'package:flutter_minesweeper/app/common/widgets/result_widget.dart';

class MinesWeeperPage extends StatelessWidget {
  const MinesWeeperPage({Key? key}) : super(key: key);

  void _restart() {
    print('Restart');
  }

  void _toOpen(FieldModel field) {
    print('to open!');
  }

  void _changeChecked(FieldModel field) {
    print('_changeChecked');
  }

  @override
  Widget build(BuildContext context) {
    FieldModel neighbor1 = FieldModel(column: 0, row: 1);
    neighbor1.undermine();

    FieldModel field = FieldModel(row: 0, column: 0);
    field.addNeighbor(neighbor1);

    try {
      // field.undermine();
      field.changeChecked();
    } on ExplosionException {}

    return Scaffold(
      appBar: ResultWidget(
        winner: null,
        onRestart: _restart,
      ),
      body: Container(
        child: FieldWidget(
          fieldModel: field,
          onOpen: _toOpen,
          onChangeChecked: _changeChecked,
        ),
      ),
    );
  }
}
