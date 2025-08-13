import 'package:flutter/material.dart';

import '../helpers/custom_helper_function.dart';
import 'custom_circluer_container.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.title,
    required this.selected,
    required this.onSelected,
  });
  final String title;
  final bool selected;
  final Function(bool) onSelected;
  @override
  Widget build(BuildContext context) {
    bool isColor = CustomHelperFunction.getColor(title) != null;
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: ChoiceChip(
        label: isColor ? SizedBox() : Text(title),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? Colors.white : null),
        shape: isColor ? CircleBorder() : null,
        padding: isColor ? EdgeInsets.zero : null,
        labelPadding: isColor ? EdgeInsets.zero : null,
        avatar:
            isColor
                ? customcirculercontainer(
                  radius: 35,
                  width: 35,
                  height: 35,
                  backgroundColor: CustomHelperFunction.getColor(title),
                )
                : null,
        backgroundColor: isColor ? CustomHelperFunction.getColor(title) : null,
      ),
    );
  }
}
