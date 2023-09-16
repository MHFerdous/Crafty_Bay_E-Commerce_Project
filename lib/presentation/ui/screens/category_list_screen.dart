import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
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
              'Categories',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().backToHome();
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return const FittedBox(
                child: CategoryCard(),
              );
            },
          ),
        ),
      ),
    );
  }
}
