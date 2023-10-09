import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  final int? categoryId;
  final ProductModel? productModel;
  const ProductListScreen({super.key, this.categoryId, this.productModel});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (widget.categoryId != null) {
          Get.find<ProductListController>()
              .getProductByCategory(widget.categoryId!);
        } else if (widget.productModel != null) {
          Get.find<ProductListController>().setProducts(widget.productModel!);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Product List',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 3,
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<ProductListController>()
              .getProductByCategory(widget.categoryId!);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<ProductListController>(
            builder: (productListController) {
              if (productListController.getProductListInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (productListController.productModel.data?.isEmpty ?? true) {
                return const Center(
                  child: Text(
                    'Empty List',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                );
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 160,
                ),
                itemCount: productListController.productModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: ProductCard(
                      product: productListController.productModel.data![index],
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
