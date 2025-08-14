import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/utils.dart';

class UserDetailsRow extends StatelessWidget {
  const UserDetailsRow({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.onPressed,
  });

  final String title;
  final String subtitle;
  final IconButton? icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Title on left
          Expanded(flex: 3, child: Utils.customText(title, fontSize: 15)),
          Expanded(
            flex: 6,
            child: Utils.customText(
              subtitle,
              fontSize: 15,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child:
                icon ??
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(Iconsax.arrow_right_3),
                ),
          ),
        ],
      ),
    );
  }
}
