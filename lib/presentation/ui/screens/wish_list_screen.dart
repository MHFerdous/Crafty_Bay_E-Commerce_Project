import 'package:crafty_bay/presentation/state_holders/add_to_wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/wish_product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Get.find<WishListController>().wishListModel;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Wish List',
            style: TextStyle(color: Colors.black),
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
          elevation: 2,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<WishListController>().wishList();
          },
          child: GetBuilder<WishListController>(
            builder: (wishListController) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          wishListController.wishListModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return WishProductCard(
                          showWishListData:
                              wishListController.wishListModel.data![index],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

