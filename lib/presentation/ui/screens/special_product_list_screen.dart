import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/special_product_controller.dart';

/*
class SpecialProductListScreen extends StatefulWidget {
  const SpecialProductListScreen({Key? key}) : super(key: key);

  @override
  State<SpecialProductListScreen> createState() =>
      _SpecialProductListScreenState();
}

class _SpecialProductListScreenState extends State<SpecialProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: const Text(
          'Special',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<SpecialProductController>().getSpecialProducts();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<SpecialProductController>(
            builder: (specialProductController) {
              if (specialProductController.getSpecialProductsInProgress) {
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
                    specialProductController.specialProductModel.data?.length ??
                        0,
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: ProductCard(
                      product: specialProductController
                          .specialProductModel.data![index],
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
