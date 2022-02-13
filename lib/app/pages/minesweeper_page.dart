import '../models/board_model.dart';
import '../models/field_model.dart';
import 'package:flutter/material.dart';
import '../models/explosion_exception.dart';
import '../common/widgets/board_widget.dart';
import '../common/widgets/result_widget.dart';

class MinesWeeperPage extends StatefulWidget {
  const MinesWeeperPage({Key? key}) : super(key: key);

  @override
  State<MinesWeeperPage> createState() => _MinesWeeperPageState();
}

class _MinesWeeperPageState extends State<MinesWeeperPage> {
  bool? _winner;
  BoardModel? _board;

  void _restart() {
    setState(() {
      _winner = null;
      _board?.restart();
    });
  }

  void _toOpen(FieldModel field) {
    if (_winner != null) {
      return;
    }

    setState(() {
      try {
        field.toOpen();
        if (_board!.resolved) {
          _winner = true;
        }
      } on ExplosionException {
        _winner = false;
        _board?.toRevelMines();
      }
    });
  }

  void _changeChecked(FieldModel field) {
    if (_winner != null) {
      return;
    }

    setState(() {
      field.changeChecked();
      if (_board!.resolved) {
        _winner = true;
      }
    });
  }

  BoardModel? _getBoard(double width, double height) {
    if (_board == null) {
      int columns = 15;
      double fieldSize = width / columns;
      int rows = (height / fieldSize).floor();

      _board = BoardModel(
        rows: rows,
        columns: columns,
        minesQuantity: 15,
      );
    }

    return _board;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultWidget(
        winner: _winner,
        onRestart: _restart,
      ),
      body: Container(
        color: Colors.grey,
        child: LayoutBuilder(
          builder: (context, constraints) => BoardWidget(
            boardModel: _getBoard(
              constraints.maxWidth,
              constraints.maxHeight,
            ),
            onOpen: _toOpen,
            onChangeChecked: _changeChecked,
          ),
        ),
      ),
    );
  }
}
