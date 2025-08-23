import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:ecommerceappwithfirebase/utils/comman/circular_icon.dart'
    show CustomeCircularIcon;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../controller/product/favoruite_controller.dart';

class CustomeFavouriteIcons extends StatefulWidget {
  CustomeFavouriteIcons({super.key, required this.productId});

  final String productId;
  @override
  State<CustomeFavouriteIcons> createState() => _FavouriteIconsState();
}

class _FavouriteIconsState extends State<CustomeFavouriteIcons> {
  final favouriteController = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomeCircularIcon(
        width: 50,
        height: 50,
        icon:
            favouriteController.isFavourite(widget.productId)
                ? Iconsax.heart5
                : Iconsax.heart,
        color:
            favouriteController.isFavourite(widget.productId)
                ? Colors.red
                : null,
        size: 35,
        onPressed: () {
          favouriteController.toggleFavouriteProduct(widget.productId);
        },
      ),
    );
  }
}
