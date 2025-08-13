import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/comman/custom_circluer_container.dart';
import '../../../../../utils/constants/custom_colorsd.dart';
import '../../../../../utils/helpers/custom_device_helper.dart';

class CustomePrimaryHeaderContainer extends StatelessWidget {
  const CustomePrimaryHeaderContainer({
    super.key,
    required this.child,
    required this.height,
  });
  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomRoundedEdges(),
      child: Container(
        height: height,
        decoration: BoxDecoration(color: CustomeColors.primary),
        child: Stack(
          children: [
            child,
            Positioned(
              top: -140,
              right: -170,
              child: customcirculercontainer(
                radius: 500,
                backgroundColor: CustomeColors.white.withOpacity(0.1),
                height: CustomeSizes.homePrimaryHeaderHeight,
                width: CustomeSizes.homePrimaryHeaderHeight,
              ),
            ),
            Positioned(
              top: 40,
              right: -250,
              child: customcirculercontainer(
                radius: 500,
                backgroundColor: CustomeColors.white.withOpacity(0.1),
                height: CustomeSizes.homePrimaryHeaderHeight,
                width: CustomeSizes.homePrimaryHeaderHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRoundedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0, size.height - 50);

    // Draw a curved line from bottom-left to bottom-right
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomRoundedEdges oldClipper) => false;
}
