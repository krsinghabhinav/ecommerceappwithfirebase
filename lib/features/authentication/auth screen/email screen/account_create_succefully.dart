// import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
// import 'package:ecommerceappwithfirebase/utils/constants/custom_text.dart';
// import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
// import 'package:ecommerceappwithfirebase/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/instance_manager.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:lottie/lottie.dart';

// import '../../../../utils/constants/custom_images_path.dart';

// class AccountCreateSuccefully extends StatefulWidget {
//   const AccountCreateSuccefully({super.key});

//   @override
//   State<AccountCreateSuccefully> createState() =>
//       _AccountCreateSuccefullyState();
// }

// class _AccountCreateSuccefullyState extends State<AccountCreateSuccefully> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(automaticallyImplyLeading: false),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: CustomeSizes.defaultSpace,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,

//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: Get.height * 0.01),
//                   // Lottie.asset(CustomImages.successfullPayment ?? ""),
//                   Image.asset("assets/images/account_created.png"),

//                   SizedBox(height: Get.height * 0.04),
//                   Utils.customText(
//                     textAlign: TextAlign.center,
//                     CustomText.textaccountcreate,
//                     fontWeight: FontWeight.bold,
//                     fontSize: CustomeSizes.defaultSpace,
//                   ),
//                   SizedBox(height: Get.height * 0.01),

//                   Utils.customText(
//                     textAlign: TextAlign.center,
//                     CustomText.textaccountcreatedesc,
//                   ),
//                   SizedBox(height: Get.height * 0.03),
//                 ],
//               ),

//               SizedBox(height: Get.height * 0.02),

//               Column(
//                 children: [
//                   Utils.customButton(
//                     text: "Continue",
//                     onTap: () {
//                       // Get.to(() => AccountCreateSuccefully());
//                     },
//                   ),
//                   SizedBox(height: Get.height * 0.02),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
