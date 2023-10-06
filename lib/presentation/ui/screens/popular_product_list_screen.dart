import 'package:crafty_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
class PopularProductListScreen extends StatefulWidget {
  const PopularProductListScreen({Key? key}) : super(key: key);

  @override
  State<PopularProductListScreen> createState() => _PopularProductListScreenState();
}

class _PopularProductListScreenState extends State<PopularProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: const Text(
          'Popular',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<PopularProductController>().getPopularProducts();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<PopularProductController>(
            builder: (popularProductController) {
              if (popularProductController.getPopularProductsInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 160,
                ),
                itemCount: popularProductController.popularProductModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return FittedBox(
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
      ),
    );
  }
}
*/
