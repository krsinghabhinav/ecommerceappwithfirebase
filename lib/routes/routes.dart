import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/email%20screen/verity_eamil_address.dart';
import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/forgot_password/forgot_screen.dart';
import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/login/login_screen.dart';
import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/onboarding/onboarding_screen.dart';
import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/signup/new_singup_screen.dart';
import 'package:ecommerceappwithfirebase/features/cart/cart_screen.dart';
import 'package:ecommerceappwithfirebase/features/checkOut/check_out_screen.dart';
import 'package:ecommerceappwithfirebase/features/order/order_screen.dart';
import 'package:ecommerceappwithfirebase/features/shopping/screen/personalization/address_screen.dart';
import 'package:ecommerceappwithfirebase/features/shopping/screen/personalization/edit_screen.dart';
import 'package:ecommerceappwithfirebase/features/shopping/screen/personalization/profile_screen.dart';
import 'package:ecommerceappwithfirebase/features/shopping/screen/store/store_screen.dart';
import 'package:ecommerceappwithfirebase/features/shopping/screen/wishlist/whishlsit_screen.dart';
import 'package:get/get.dart';

import '../navigation_menubar.dart';
import 'app_routes.dart';

class CustomRoutesApp {
  static final screens = [
    // ... other screens
    GetPage(name: CustomRoutes.home, page: () => const NavigationMenubar()),
    GetPage(name: CustomRoutes.store, page: () => const StoreScreen()),
    GetPage(name: CustomRoutes.wishlist, page: () => const WhishlsitScreen()),
    GetPage(name: CustomRoutes.profile, page: () => const ProfileScreen()),
    GetPage(name: CustomRoutes.order, page: () => const OrderScreen()),
    GetPage(name: CustomRoutes.checkout, page: () => const CheckOutScreen()),
    GetPage(name: CustomRoutes.cart, page: () => const CartScreen()),
    GetPage(name: CustomRoutes.editProfile, page: () => const EditScreen()),
    GetPage(name: CustomRoutes.userAddress, page: () => const AddressScreen()),
    GetPage(name: CustomRoutes.signup, page: () => const NewSingupScreen()),
    GetPage(name: CustomRoutes.verifyEmail, page: () => VerityEamilAddress()),
    GetPage(name: CustomRoutes.signIn, page: () => LoginScreen()),
    GetPage(name: CustomRoutes.forgetPassword, page: () => ForgotScreen()),
    GetPage(name: CustomRoutes.onBoarding, page: () => OnboardingScreen()),
  ];
}
