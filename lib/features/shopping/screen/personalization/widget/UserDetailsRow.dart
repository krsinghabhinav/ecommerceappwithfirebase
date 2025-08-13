
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/utils.dart';

class UserDetailsRow extends StatelessWidget {
  const UserDetailsRow({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  final String title;
  final String subtitle;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
          Expanded(flex: 1, child: icon ?? const Icon(Iconsax.arrow_right_3)),
        ],
      ),
    );
  }
}
