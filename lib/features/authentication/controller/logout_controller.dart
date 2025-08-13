import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/utils.dart';
import '../auth screen/login/login_screen.dart';

class LogoutController extends GetxController {
  var loading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;





  Future<void> logout() async {
    try {
      loading.value = true;

      // Sign out from Firebase
      await auth.signOut()  ; 

      // Show logout success message
      Utils.showToast("You have been successfully logged out.");

      // Navigate to login screen and clear the previous navigation stack
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FirebaseException catch (e) {
      Utils.showToast("Firebase Error: ${e.message}");
    } on PlatformException catch (e) {
      Utils.showToast("Platform Error: ${e.message}");
    } on FormatException {
      Utils.showToast("Data format is invalid.");
    } catch (e) {
      Utils.showToast("Unexpected error occurred: ${e.toString()}");
    } finally {
      loading.value = false;
    }
  }


  
}
