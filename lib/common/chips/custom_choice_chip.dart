import 'package:flutter/material.dart';
import 'package:mystore/common/custom_shapes/circular_container.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../utils/constants/colors.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({super.key, required this.text, required this.selected, this.onSelected});
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = HelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? const SizedBox(): Text(text),
      selected: selected,
      onSelected:onSelected,
      labelStyle: TextStyle(color: selected ? AppColors.white: null),
      avatar: isColor ? CircularContainer(width: 50,height: 50,backgroundColor: HelperFunctions.getColor(text)!): null,
      shape: isColor ? const CircleBorder(): null,
      padding:  isColor ? const EdgeInsets.all(0): null,
      labelPadding: isColor ? const EdgeInsets.all(0): null,
      backgroundColor:   HelperFunctions.getColor(text),
      selectedColor: isColor ? HelperFunctions.getColor(text) : AppColors.primary,


    );
  }
}
