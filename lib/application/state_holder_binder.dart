import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/create_review_controller.dart';
import 'package:crafty_bay/presentation/state_holders/review_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/wish_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/create_invoice_controller.dart';
import 'package:crafty_bay/presentation/state_holders/create_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_controller.dart';
import 'package:get/get.dart';
import '../presentation/state_holders/main_bottom_nav_controller.dart';
import '../presentation/state_holders/popular_product_controller.dart';
import '../presentation/state_holders/product_list_controller.dart';
import '../presentation/state_holders/read_profile_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(
      MainBottomNavController(),
    );
    Get.put(
      EmailVerificationController(),
    );
    Get.put(
      OtpVerificationController(),
    );
    Get.put(
      HomeSlidersController(),
    );
    Get.put(
      CategoryController(),
    );
    Get.put(
      PopularProductController(),
    );
    Get.put(
      SpecialProductController(),
    );
    Get.put(
      NewProductController(),
    );
    Get.put(
      ProductDetailsController(),
    );
    Get.put(
      AddToCartController(),
    );
    Get.put(
      ProductListController(),
    );
    Get.put(
      CartListController(),
    );
    Get.put(
      CreateProfileController(),
    );

    Get.put(
      WishListController(),
    );
    Get.put(
      CreateInvoiceController(),
    );
    Get.put(
      ReviewListController(),
    );
    Get.put(
      CreateReviewController(),
    );
    Get.put(
      ReadProfileController(),
    );
  }
}
