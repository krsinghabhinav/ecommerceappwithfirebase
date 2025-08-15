import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/comman/circular_image.dart';
import '../../../../utils/comman/custom_section_heading_text.dart';
import '../../../../utils/comman/customappbar.dart';
import '../../../../utils/constants/custome_sizes.dart';
import '../../../../utils/utils.dart';
import '../home/widgets/primaryheadercontainer.dart';
import 'change_username_screeen.dart';
import '../../../../controller/user_controller.dart';
import 'widget/CustomProfileWithEditIcon.dart';
import 'widget/UserDetailsRow.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        // ✅ makes content scrollable on small screens
        child: Column(
          children: [
            CustomProfileWithEditIcon(),
            const SizedBox(height: 70),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomeSectionHeadingText(title: "Account Setting"),
            ),

            Obx(
              () => UserDetailsRow(
                title: "Name",
                subtitle: userController.user.value.fullName,
                icon: IconButton(
                  onPressed: () {
                    Get.to(ChangeUsernameScreeen());
                  },
                  icon: Icon(Iconsax.arrow_right_3),
                ),
              ),
            ),
            Obx(
              () => UserDetailsRow(
                title: "Username",
                subtitle:
                    userController.user.value.username!.toLowerCase() ??
                    " Not Available",
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.arrow_right_3),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomeSectionHeadingText(title: "Profile Settings"),
            ),
            Obx(
              () => UserDetailsRow(
                title: "User ID",
                subtitle: userController.user.value.id.toString(),
                icon: IconButton(onPressed: () {}, icon: Icon(Iconsax.copy)),
              ),
            ),
            Obx(
              () => UserDetailsRow(
                title: "Email",
                subtitle: userController.user.value.email ?? "Not Available",
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.arrow_right_3),
                ),
              ),
            ),
            Obx(
              () => UserDetailsRow(
                title: "Phone No",
                subtitle: "+91 ${userController.user.value.phoneNumber}",
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.arrow_right_3),
                ),
              ),
            ),
            UserDetailsRow(
              title: "Gender",
              subtitle: "Male",
              icon: IconButton(
                onPressed: () {},
                icon: Icon(Iconsax.arrow_right_3),
              ),
            ),
            Divider(),

            TextButton(
              onPressed: () {
                userController.deleteAccountWarningPopup();
              },
              child: Utils.customText(
                "Close Account",
                color: CustomeColors.error,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
