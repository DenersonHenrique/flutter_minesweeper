import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_minesweeper/app/models/field_model.dart';

void main() {
  group('Field', () {
    test('To open field with explosion.', () {
      FieldModel fieldModel = FieldModel(row: 0, column: 0);
      fieldModel.underMine();

      expect(fieldModel.toOpen, throwsException);
    });

    test('To open field with not explosion.', () {
      FieldModel fieldModel = FieldModel(row: 0, column: 0);
      fieldModel.toOpen();

      expect(fieldModel.open, isTrue);
    });

    test('Add neighbor.', () {
      FieldModel fieldModel = FieldModel(row: 3, column: 3);
      FieldModel fieldModelTwo = FieldModel(row: 3, column: 4);
      FieldModel fieldModelThree = FieldModel(row: 2, column: 2);
      FieldModel fieldModelFour = FieldModel(row: 4, column: 4);

      fieldModel.addNeighbor(fieldModelTwo);
      fieldModel.addNeighbor(fieldModelThree);
      fieldModel.addNeighbor(fieldModelFour);

      expect(fieldModel.neighbors.length, 3);
    });

    test('Not is a neighbor.', () {
      FieldModel fieldModel = FieldModel(row: 0, column: 0);
      FieldModel fieldModelTwo = FieldModel(row: 1, column: 3);
      fieldModel.addNeighbor(fieldModelTwo);

      expect(fieldModel.neighbors.isEmpty, isTrue);
    });

    test('Mines in the neighborhood', () {
      FieldModel fieldModel = FieldModel(row: 3, column: 3);
      FieldModel fieldModelTwo = FieldModel(row: 3, column: 4);
      fieldModelTwo.underMine();
      FieldModel fieldModelThree = FieldModel(row: 2, column: 2);
      FieldModel fieldModelFour = FieldModel(row: 4, column: 4);
      fieldModelFour.underMine();

      fieldModel.addNeighbor(fieldModelTwo);
      fieldModel.addNeighbor(fieldModelThree);
      fieldModel.addNeighbor(fieldModelFour);

      expect(fieldModel.quantityMinesInTheNeighborhood, 2);
    });
  });
}
