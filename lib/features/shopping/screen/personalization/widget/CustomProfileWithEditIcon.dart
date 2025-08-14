import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/comman/circular_image.dart';
import '../change_username_screeen.dart';
import '../controller/user_controller.dart';

class CustomProfileWithEditIcon extends StatefulWidget {
  const CustomProfileWithEditIcon({super.key});

  @override
  State<CustomProfileWithEditIcon> createState() =>
      _CustomProfileWithEditIconState();
}

class _CustomProfileWithEditIconState extends State<CustomProfileWithEditIcon> {
  late UserController userController;
  @override
  void initState() {
    userController = Get.put(UserController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<UserController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // ⬅️ enough space for profile image to float
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Example: You can add background if needed
          Positioned(
            bottom: -60, // ⬅️ Profile image will appear below container
            child: Obx(
              () => CustomCircularImage(
                isNetworkImage: true,
                borderColor: Colors.blue,
                borderWidth: 2,
                image: userController.user.value.profilePicture.toString(),
                height: 120,
                width: 120,
              ),
            ),
          ),
          Positioned(
            bottom: -28, // ⬅️ Profile image will appear below container
            child: IconButton(
              onPressed: () {
                Get.to(ChangeUsernameScreeen());
              },
              icon: Icon(Iconsax.edit),
            ),
          ),
        ],
      ),
    );
  }
}
