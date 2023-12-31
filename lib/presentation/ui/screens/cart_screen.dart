import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';
import '../widgets/cart_product_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Get.find<CartListController>().getCartList();
        /*print(
            ' from cart screen ${AuthController.updateProfile}');

        if (AuthController.updateProfile == null) {
          Get.off(
            () => const CompleteProfileScreen(),
          )?.then(
            (value) {
              Get.find<CartListController>().getCartList();
            },
          );
        } else {
          Get.find<CartListController>().getCartList();
        }*/
      },
    );
  }

  /* @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProfileController>().readProfile();
      if (ProfileController().readProfileData.cusName == null) {
        Get.to(
          () => const CompleteProfileScreen(),
        )?.then(
          (value) {
            Get.find<CartListController>().getCartList();
          },
        );
      } else {
        Get.find<CartListController>().getCartList();
      }
    });
    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Carts',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Get.find<MainBottomNavController>().backToHome();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<CartListController>().getCartList();
        },
        child: GetBuilder<CartListController>(
          builder: (cartListController) {
            if (cartListController.getCartListInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (cartListController.cartListModel.data?.isEmpty ?? true) {
              return const Center(
                child: Text('Nothing to show'),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        cartListController.cartListModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return CartProductCard(
                        cartData: cartListController.cartListModel.data![index],
                      );
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.15),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '\$ ${cartListController.totalPrice}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            if (Get.find<CartListController>()
                                    .cartListModel
                                    .data
                                    ?.isNotEmpty ??
                                false) {
                              Get.to(
                                () => const CheckOutScreen(),
                              );
                            }
                          },
                          child: const Text('Checkout'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
