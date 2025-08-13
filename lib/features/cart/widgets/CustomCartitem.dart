
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/comman/CustomBrantTitleWithVerifyIcons.dart';
import '../../../utils/comman/CustomProductTitle.dart';

class CustomCartitem extends StatelessWidget {
  const CustomCartitem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBrantTitleWithVerifyIcons(
            title: "Apple",
          ),
          const SizedBox(height: 4),
          const CustomProductTitle(
            title: "iPhone 11 64GB",
            large: 14,
            isSmallSize: false,
          ),
          const SizedBox(height: 6),
    
          /// Color & Storage Info
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 14),
              children: [
                TextSpan(
                  text: "Color",
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: " Green  ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: "Storage",
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: " 512GB",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
