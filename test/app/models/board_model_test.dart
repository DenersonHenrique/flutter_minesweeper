import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_minesweeper/app/models/board_model.dart';

void main() {
  test('To winner game', () {
    BoardModel boardModel = BoardModel(
      rows: 2,
      columns: 2,
      minesQuantity: 0,
    );

    boardModel.fields[0].undermine();
    boardModel.fields[3].undermine();

    boardModel.fields[0].changeChecked();
    boardModel.fields[1].toOpen();
    boardModel.fields[2].toOpen();
    boardModel.fields[3].changeChecked();

    expect(boardModel.resolved, isTrue);
  });
}
