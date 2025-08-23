import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomeCircularIcon extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final double? size;
  const CustomeCircularIcon({super.key, this.icon, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(
        icon ?? Iconsax.heart5,
        size: size ?? 30,
        color: color ?? Colors.red,
      ),
      onPressed: () {},
    );
  }
}
