// global_bindings.dart
import 'package:get/get.dart';
import '../data/repositories/authentications_repo.dart';
import '../data/repositories/user_repository.dart';
import '../features/authentication/controller/forgetpassword_controller.dart';
import '../features/authentication/controller/google_auth_controller.dart';
import '../features/authentication/controller/logout_controller.dart';
import '../features/authentication/controller/signup_controller.dart';
import '../features/shopping/screen/personalization/controller/user_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    // Repositories (immediate load)
    Get.put<AuthenticationsRepoController>(
      AuthenticationsRepoController(),
      permanent: true,
    );
    Get.put<UserRepository>(UserRepository(), permanent: true);

    // Controllers (lazy load with fenix so they auto-recreate if disposed)
    Get.lazyPut<LogoutController>(() => LogoutController(), fenix: true);
    Get.lazyPut<GoogleAuthController>(
      () => GoogleAuthController(),
      fenix: true,
    );
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
    Get.lazyPut<SignupController>(() => SignupController(), fenix: true);
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
      fenix: true,
    );
  }
}
