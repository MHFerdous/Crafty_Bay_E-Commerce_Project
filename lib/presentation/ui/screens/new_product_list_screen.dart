import 'package:crafty_bay/presentation/state_holders/new_product_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
class NewProductListScreen extends StatefulWidget {
  const NewProductListScreen({Key? key}) : super(key: key);

  @override
  State<NewProductListScreen> createState() => _NewProductListScreenState();
}

class _NewProductListScreenState extends State<NewProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: const Text(
          'New',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<NewProductController>().getNewProducts();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<NewProductController>(
            builder: (newProductController) {
              if (newProductController.getNewProductsInProgress) {
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
                itemCount:
                    newProductController.newProductModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: ProductCard(
                      product:
                          newProductController.newProductModel.data![index],
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
