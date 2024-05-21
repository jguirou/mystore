import 'package:get/get.dart';
import 'package:mystore/presentation/email_verification/ui/screen/email_verification_screen.dart';
import 'package:mystore/presentation/forgot_password/ui/screen/forgot_password_screen.dart';
import 'package:mystore/presentation/login/ui/screen/login_screen.dart';
import 'package:mystore/presentation/profile/profile/ui/screen/profile_screen.dart';
import 'package:mystore/presentation/shop/home/cart/ui/screen/cart_screen.dart';
import 'package:mystore/presentation/shop/home/home/ui/screen/home_screen.dart';
import 'package:mystore/presentation/shop/home/order_review/ui/screen/checkout_screen.dart';
import 'package:mystore/presentation/shop/product_detail/product_reviews/ui/screen/product_reviews_screen.dart';
import 'package:mystore/presentation/shop/store/store/ui/screen/store_screen.dart';
import 'package:mystore/presentation/shop/wish_list/ui/screen/wish_list_screen.dart';
import 'package:mystore/presentation/sign_up/ui/screen/sign_up_screen.dart';
import 'package:mystore/routes/routes.dart';

import '../presentation/on_boarding/ui/screen/on_boarding_screen.dart';

class AppRoutes{
  static final pages = [
    GetPage(name: CustomRoutes.home, page: ()=> const HomeScreen()),
    GetPage(name: CustomRoutes.store, page: ()=> const StoreScreen()),
    GetPage(name: CustomRoutes.favourites, page: ()=> const WishListScreen()),
    GetPage(name: CustomRoutes.settings, page: ()=> const ProfileScreen()),
    GetPage(name: CustomRoutes.productReviews, page: ()=> const ProductReviewsScreen()),
    GetPage(name: CustomRoutes.order, page: ()=> const OrderReviewScreen()),
    //GetPage(name: CustomRoutes.checkout, page: ()=> const CheckoutScreen()),
    GetPage(name: CustomRoutes.cart, page: ()=> const CartScreen()),
    GetPage(name: CustomRoutes.userProfile, page: ()=> const ProfileScreen()),
    //GetPage(name: CustomRoutes.userAddress, page: ()=> const UserAddressScreen()),
    GetPage(name: CustomRoutes.signup, page: ()=> const SignUpScreen()),
    GetPage(name: CustomRoutes.verifyEmail, page: ()=> const EmailVerificationScreen()),
    GetPage(name: CustomRoutes.signIn, page: ()=> const LoginScreen()),
    GetPage(name: CustomRoutes.forgetPassword, page: ()=> const ForgotPasswordScreen()),
    GetPage(name: CustomRoutes.onBoarding, page: ()=> const OnBoardingScreen()),
  ];
}