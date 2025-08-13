// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// import '../../../../utils/utils.dart';
// import '../../controller/google_auth_controller.dart';
// import '../../controller/login_controller.dart';
// import '../signup/singup_screen.dart';


// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   // LoginController loginController = Get.put(LoginController());
//   // GoogleAuthController googleAuthController = Get.put(GoogleAuthController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.red, title: Text("Login Screen")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Utils.customTextFormField(
//               label: "Email",
//               hintText: "Enter your email",
//               controller:TextEditingController(),
//               keyboardType: TextInputType.emailAddress,
//               prefixIcon: Icons.email,
//             ),
//             SizedBox(height: 10),
//             Utils.customTextFormField(
//               label: "Password",
//               hintText: "Enter your password",
//               controller: TextEditingController(),
//               keyboardType: TextInputType.emailAddress,
//               prefixIcon: Icons.password,
//               suffixIcon: Icons.visibility_off_outlined,
//             ),
//             SizedBox(height: 10),
//            /*  Obx(
//               () => loginController.isLoading.value
//                   ? Center(child: CircularProgressIndicator())
//                   : */ Utils.customButton(
//                       text: 'Login',
//                       onTap: () {
//                         // loginController.login();
//                         print('Login tapped!');
//                       },
//                     ),
//             // ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("If you want to ", style: TextStyle(fontSize: 18)),
//                 GestureDetector(
//                   onTap: () {
//                     Get.to(() => SingupScreen());
//                   },
//                   child: Text(
//                     "Signup",
//                     style: TextStyle(fontSize: 18, color: Colors.blue),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Container(
//               height: 40,
//               width: 50,
//               child: GestureDetector(
//                 onTap: () {
//                   // googleAuthController.loginWithGoogle();
//                 },
//                 child: Image.asset(
//                   "assests/images/google.png",
//                   height: 40,
//                   width: 50,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
