import 'package:flutter/material.dart';
import '../../models/field_model.dart';
import '../../constants/image_assets.dart';

class FieldWidget extends StatelessWidget {
  final FieldModel fieldModel;
  final void Function(FieldModel) onOpen;
  final void Function(FieldModel) onChangeChecked;

  const FieldWidget({
    required this.fieldModel,
    required this.onOpen,
    required this.onChangeChecked,
    Key? key,
  }) : super(key: key);

  Widget _getImage() {
    int quantityMines = fieldModel.quantityMinesInTheNeighborhood;

    if (fieldModel.open && fieldModel.mined && fieldModel.exploded) {
      return Image.asset(ImageAssets.bomb0);
    } else if (fieldModel.open && fieldModel.mined) {
      return Image.asset(ImageAssets.bomb1);
    } else if (fieldModel.open) {
      return Image.asset(ImageAssets.openImage(quantityMines));
    } else if (fieldModel.checked) {
      return Image.asset(ImageAssets.flag);
    } else {
      return Image.asset(ImageAssets.closed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(fieldModel),
      onLongPress: () => onChangeChecked(fieldModel),
      child: _getImage(),
    );
  }
}
