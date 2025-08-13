// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../utils/utils.dart';
// import '../../controller/signup_controller.dart';

// class SingupScreen extends StatefulWidget {
//   const SingupScreen({super.key});

//   @override
//   State<SingupScreen> createState() => _SingupScreenState();
// }

// class _SingupScreenState extends State<SingupScreen> {
//   SignupController signupController = Get.put(SignupController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.red, title: Text("Singup Screen")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Utils.customTextFormField(
//               label: "Username",
//               hintText: "Enter your username",
//               controller: signupController.userNameController,
//               keyboardType: TextInputType.emailAddress,
//               prefixIcon: Icons.email,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your username';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 10),
//             Utils.customTextFormField(
//               label: "Email",
//               hintText: "Enter your email",
//               controller: signupController.emailController,
//               keyboardType: TextInputType.emailAddress,
//               prefixIcon: Icons.email,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your email';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 10),
//             Utils.customTextFormField(
//               label: "Password",
//               hintText: "Enter your password",
//               controller: signupController.passwordController,
//               keyboardType: TextInputType.emailAddress,
//               prefixIcon: Icons.password,
//               suffixIcon: Icons.visibility_off_outlined,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your password';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 10),
//             Obx(
//               () =>
//                   signupController.isLoading.value
//                       ? Center(child: CircularProgressIndicator())
//                       : Utils.customButton(
//                         text: 'Signup',
//                         onTap: () {
//                           signupController.signup();
//                           print('Login tapped!');

//                           signupController.userNameController.clear();
//                           signupController.emailController.clear();
//                           signupController.passwordController.clear();

//                           // Get.back();
//                         },
//                       ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
