import 'package:crafty_bay/presentation/state_holders/wish_list_controller.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<WishListController>().showWishList();
    });
    super.initState();
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
            Get.find<WishListController>().showWishList();
          },
          child: GetBuilder<WishListController>(
            builder: (showWishListController) {
              if (showWishListController.wishListInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (showWishListController.showWishListModel.data?.isEmpty ?? true) {
                return const Center(
                  child: Text(
                    'Nothing to show'),
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: showWishListController
                          .showWishListModel.data?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return WishProductCard(
                          showWishListData: showWishListController
                              .showWishListModel.data![index],
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
