import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_controller.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              mainAxisExtent: 160
            ),
            itemBuilder: (context, index) {
              return const FittedBox(
                child: ProductCard(),
              );
            },
          ),
        ),
      ),
    );
  }
}
