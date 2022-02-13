import 'field_widget.dart';
import 'package:flutter/material.dart';
import '../../models/board_model.dart';
import '../../models/field_model.dart';

class BoardWidget extends StatelessWidget {
  final BoardModel? boardModel;
  final void Function(FieldModel) onOpen;
  final void Function(FieldModel) onChangeChecked;

  const BoardWidget({
    Key? key,
    required this.boardModel,
    required this.onOpen,
    required this.onChangeChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: boardModel!.columns,
      children: boardModel!.fields
          .map(
            (element) => FieldWidget(
              fieldModel: element,
              onOpen: onOpen,
              onChangeChecked: onChangeChecked,
            ),
          )
          .toList(),
    );
  }
}
