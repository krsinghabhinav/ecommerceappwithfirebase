import 'package:ecommerceappwithfirebase/common/localstoragetext.dart';
import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/email%20screen/verity_eamil_address.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../features/authentication/auth screen/login/login_screen.dart';
import '../../features/authentication/auth screen/onboarding/onboarding_screen.dart';
import '../../navigation_menubar.dart';

class AuthenticationsRepoController extends GetxController {
  final storage = GetStorage();
  final auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;
  void screenRedirect() async {
    await Future.delayed(const Duration(seconds: 3)); // Wait for splash

    // Set default value if not present
    storage.writeIfNull(Localstoragetext.isFirstTime, true);

    final isFirstTime = storage.read(Localstoragetext.isFirstTime);
    final user = auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenubar());
      } else {
        Get.offAll(() => VerityEamilAddress());
      }
    } else {
      if (isFirstTime == true) {
        Get.offAll(() => OnboardingScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    }
  }
}
