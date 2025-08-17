import 'package:flutter/widgets.dart';

import '../utils.dart';

class CustomproductPrice extends StatelessWidget {
  const CustomproductPrice({
    super.key,
    required this.price,
    this.isLarge = false,
    this.lineThrough = false,
    this.lg,
    this.sm,
    this.color,
  });
  final String price;
  final bool isLarge, lineThrough;
  final double? lg, sm;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Utils.customText(
        price,
        fontSize: isLarge ? lg : sm,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        color: color,
      ),
    );
  }
}
