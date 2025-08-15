import 'package:ecommerceappwithfirebase/utils/comman/circular_image.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custom_section_heading_text.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/comman/custom_search_bar.dart';
import '../../../../controller/google_auth_controller.dart';
import '../../../../controller/logout_controller.dart';
import '../../../../controller/verify_eamil_controller.dart';
import '../../../authentication/auth screen/login/login_screen.dart';
import '../../../authentication/auth screen/signup/new_singup_screen.dart';
import '../../../order/order_screen.dart';
import '../home/widgets/primaryheadercontainer.dart';
import '../store/widgets/CustomePrimaryStoreHeader.dart';
import 'address_screen.dart';
import '../../../../controller/user_controller.dart';
import 'edit_screen.dart';
import 'widget/CustomUserProfileTile.dart';
import 'widget/SettingMenuTile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late LogoutController logoutController;
  late UserController userController;
  late GoogleAuthController googleAuthController;

  @override
  void initState() {
    userController = Get.put(UserController());
    logoutController = Get.put(LogoutController());
    googleAuthController = Get.put(GoogleAuthController());
    super.initState();
  }

  @override
  void dispose() {
    // Properly remove controller from memory
    Get.delete<LogoutController>();
    Get.delete<UserController>();
    Get.delete<GoogleAuthController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ✅ Header section with constrained height
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Header background container
              CustomePrimaryHeaderContainer(
                height: CustomeSizes.profilePrimaryHeaderHeight,
                child: Container(),
              ),

              // ✅ Positioned circular profile image
              Positioned(
                bottom: -60, // Pulls the image down outside the header
                child: Obx(
                  () => CustomCircularImage(
                    isNetworkImage: true,
                    image: userController.user.value.profilePicture.toString(),
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 70), // Push content below the image
          Obx(
            () => CustomUserProfileTile(
              nameText: userController.user.value.fullName,
              emailText: userController.user.value.email,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CustomeSectionHeadingText(title: "Account Setting"),
          ),

          SettingMenuTile(
            title: "My Address",
            subtitle: "Set shopping delivery addresses",
            icon: Icon(Iconsax.home),
            onTab: () {
              print("print addresses");
              Get.to(() => AddressScreen());
            },
          ),

          SettingMenuTile(
            title: "My Cart",
            subtitle: "Add, remove products and move to checkout",
            icon: Icon(Iconsax.shopping_bag),
            onTab: () {},
          ),
          SettingMenuTile(
            title: "My Orders",
            subtitle: "In-progress and Completed Orders",
            icon: Icon(Iconsax.shop),
            onTab: () {
              Get.to(() => OrderScreen());
            },
          ),
          const SizedBox(height: 20), // Push content below the image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Utils.customOutlinedButton(
              text: "Logout",
              onPressed: () async {
                try {
                  final googleUser = await GoogleSignIn().isSignedIn();
                  if (googleUser) {
                    await googleAuthController.signOut();
                  } else {
                    await logoutController.logout();
                  }
                } catch (e) {
                  Utils.showToast("Logout error: ${e.toString()}");
                }

                logoutController.logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
