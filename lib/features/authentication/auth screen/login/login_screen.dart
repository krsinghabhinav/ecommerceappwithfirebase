import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../navigation_menubar.dart';
import '../../../../../utils/constants/custom_colorsd.dart';
import '../../../../../utils/constants/custom_text.dart';
import '../../../../../utils/constants/custome_sizes.dart';
import '../../../../../utils/utils.dart';
import '../../../../utils/constants/custom_images_path.dart';
import '../../../../controller/google_auth_controller.dart';
import '../../../../controller/login_controller.dart';
import '../forgot_password/forgot_screen.dart';
import '../signup/new_singup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());
  late GoogleAuthController loginWithGoogle;

  @override
  void initState() {
    loginWithGoogle = Get.put(GoogleAuthController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<GoogleAuthController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: CustomeSizes.defaultSpace,
                        vertical: CustomeSizes.defaultSpace,
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // ✅ Center vertically
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // ✅ Center horizontally
                        children: [
                          /// Title & Subtitle
                          Utils.customText(
                            CustomText.textsignin,
                            fontWeight: FontWeight.bold,
                            fontSize: CustomeSizes.defaultSpace,
                          ),
                          Utils.customText(CustomText.textsignindes),
                          SizedBox(height: Get.height * 0.03),

                          /// Email & Password Fields
                          Utils.customTextFormField(
                            label: "Email",
                            hintText: "Email",
                            controller: loginController.emailController,
                            prefixIcon: Iconsax.direct_right,
                          ),
                          SizedBox(height: Get.height * 0.03),
                          Obx(
                            () => Utils.customTextFormField(
                              obscureText:
                                  !loginController.isPasswordVisible.value,
                              label: "Password",
                              hintText: "Password",
                              controller: loginController.passwordController,
                              prefixIcon: Iconsax.password_check,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  loginController.isPasswordVisible.value =
                                      !loginController.isPasswordVisible.value;
                                },
                                icon: Icon(
                                  loginController.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.01),

                          /// Remember Me & Forgot
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: loginController.rememberMe.value,
                                  onChanged: (value) {
                                    loginController.rememberMe.value =
                                        !loginController.rememberMe.value;
                                  },
                                ),
                              ),
                              Utils.customText(
                                "Remember Me",
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const ForgotScreen());
                                },
                                child: Utils.customText(
                                  "Forget Password?",
                                  fontWeight: FontWeight.w600,
                                  color: CustomeColors.buttonPrimary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.02),

                          /// Sign In & Create Account Buttons
                          Utils.customButton(
                            text: "Sign in",
                            onTap: () async {
                              await loginController.login();
                              /*   if (result != null) {
                                Get.offAll(() => const NavigationMenubar());
                              } */
                            },
                          ),
                          SizedBox(height: Get.height * 0.01),
                          Utils.customOutlinedButton(
                            text: "Create Account",
                            onPressed: () {
                              Get.to(() => const NewSingupScreen());
                            },
                          ),
                          SizedBox(height: Get.height * 0.03),

                          /// Divider with Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: Get.width * 0.25,
                                height: 1.5,
                                color: CustomeColors.buttonPrimary,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Utils.customText(
                                  "Or Sign In With",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                width: Get.width * 0.25,
                                height: 1.5,
                                color: CustomeColors.buttonPrimary,
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.02),

                          /// Social Login
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  loginWithGoogle.signInWithGoogle();
                                },
                                child: Utils.customIcon(
                                  imagePath: CustomImages.google,
                                  size: Get.width * 0.12,
                                  borderColor: CustomeColors.grey,
                                  backgroundColor: CustomeColors.white,
                                ),
                              ),
                              SizedBox(width: Get.width * .02),
                              Utils.customIcon(
                                imagePath: CustomImages.fb,
                                size: Get.width * 0.12,
                                borderColor: CustomeColors.grey,
                                backgroundColor: CustomeColors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
