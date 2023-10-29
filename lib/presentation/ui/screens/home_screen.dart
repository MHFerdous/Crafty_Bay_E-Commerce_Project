import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/update_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/new_product_controller.dart';
import '../../state_holders/special_product_controller.dart';
import '../widgets/category_card.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/home/home_slider.dart';
import '../widgets/home/section_header.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.craftyBayNavLogoSVG),
            const Spacer(),
            CircularIconButton(
              icon: Icons.person_2_outlined,
              onTap: () {
                if (AuthController.updateProfile != null) {
                  Get.to(
                    () => const UpdateProfileScreen(),
                  );
                } else {
                  Get.to(
                    () => const CompleteProfileScreen(),
                  );
                }
              },
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.call_outlined,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Contact for help:'),
                        ],
                      ),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '01XXXXXXXXX',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '01XXXXXXXXX',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.notifications_active_outlined,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.light_mode_outlined,
              onTap: () {
                Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                );
              },
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.logout_outlined,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Logging Out...'),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      content: const Text(
                        'Are you sure?',
                        style: TextStyle(fontSize: 18),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<PopularProductController>().getPopularProducts();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    prefixIcon: const Icon(Icons.search_outlined),
                    hintText: 'Search',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GetBuilder<HomeSlidersController>(
                  builder: (homeSliderController) {
                    if (homeSliderController.getHomeSlidersInProgress) {
                      return const SizedBox(
                        height: 180,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return HomeSlider(
                      sliders: homeSliderController.sliderModel.data ?? [],
                    );
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                SectionHeader(
                  title: 'Categories',
                  onTap: () {
                    Get.find<MainBottomNavController>().changeScreen(1);
                  },
                ),
                SizedBox(
                  height: 90,
                  child: GetBuilder<CategoryController>(
                    builder: (categoryController) {
                      if (categoryController.getCategoriesInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        itemCount:
                            categoryController.categoryModel.data?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            categoryData:
                                categoryController.categoryModel.data![index],
                            onTap: () {
                              Get.to(
                                ProductListScreen(
                                    categoryId: categoryController
                                        .categoryModel.data![index].id!),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SectionHeader(
                  title: 'Popular',
                  onTap: () {
                    Get.to(
                      () => ProductListScreen(
                        productModel: Get.find<PopularProductController>()
                            .popularProductModel,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 176,
                  child: GetBuilder<PopularProductController>(
                    builder: (popularProductController) {
                      if (popularProductController
                          .getPopularProductsInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: popularProductController
                                .popularProductModel.data?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 8, right: 4, bottom: 8),
                            child: ProductCard(
                              product: popularProductController
                                  .popularProductModel.data![index],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SectionHeader(
                  title: 'Special',
                  onTap: () {
                    Get.to(
                      () => ProductListScreen(
                        productModel: Get.find<SpecialProductController>()
                            .specialProductModel,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 176,
                  child: GetBuilder<SpecialProductController>(
                    builder: (specialController) {
                      if (specialController.getSpecialProductsInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: specialController
                                .specialProductModel.data?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 4, bottom: 8),
                            child: ProductCard(
                              product: specialController
                                  .specialProductModel.data![index],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SectionHeader(
                  title: 'New',
                  onTap: () {
                    Get.to(
                      () => ProductListScreen(
                        productModel:
                            Get.find<NewProductController>().newProductModel,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 176,
                  child: GetBuilder<NewProductController>(
                    builder: (newController) {
                      if (newController.getNewProductsInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            newController.newProductModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 4, bottom: 8),
                            child: ProductCard(
                              product:
                                  newController.newProductModel.data![index],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
