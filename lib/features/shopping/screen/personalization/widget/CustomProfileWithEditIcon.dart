import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/comman/circular_image.dart';
import '../../../../../controller/signup_controller.dart';
import '../../../../../controller/user_controller.dart';

class CustomProfileWithEditIcon extends StatefulWidget {
  const CustomProfileWithEditIcon({super.key});

  @override
  State<CustomProfileWithEditIcon> createState() =>
      _CustomProfileWithEditIconState();
}

class _CustomProfileWithEditIconState extends State<CustomProfileWithEditIcon> {
  late UserController userController;
  late SignupController signupController;

  @override
  void initState() {
    super.initState();
    signupController = Get.find<SignupController>();
    userController = Get.find<UserController>();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -60,
            child: Obx(() {
              // Image priority: Newly picked image → Updated from userController
              String img = "";
              if (signupController.imageUrl.value.isNotEmpty) {
                img = signupController.imageUrl.value;
              } else if (userController.user.value.profilePicture != null &&
                  userController.user.value.profilePicture!.isNotEmpty) {
                img = userController.user.value.profilePicture!;
              }

              return CustomCircularImage(
                isNetworkImage: true,
                borderColor: Colors.blue,
                borderWidth: 2,
                image: img,
                height: 120,
                width: 120,
              );
            }),
          ),
          Positioned(
            bottom: -28,
            child: Obx(() {
              // Agar uploading ho rahi hai to loading indicator
              if (signupController.isImageUploading.value) {
                return const SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              }

              // Agar uploading nahi ho rahi hai to edit button
              return IconButton(
                onPressed: () async {
                  // Upload start hone se pehle flag true
                  signupController.isImageUploading.value = true;
                  await signupController.showImagePickerSheet(context);
                  // Upload complete hone ke baad flag false
                  signupController.isImageUploading.value = false;
                },
                icon: const Icon(Iconsax.edit),
              );
            }),
          ),
        ],
      ),
    );
  }
}
