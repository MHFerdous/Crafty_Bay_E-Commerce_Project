import 'package:crafty_bay/data/models/product_details.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/review_list_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';
import '../widgets/home/product_image_slider.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if (productDetailsController.getProductDetailsInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ProductImageSlider(
                              imageList: [
                                productDetailsController.productDetails.img1 ??
                                    '',
                                productDetailsController.productDetails.img2 ??
                                    '',
                                productDetailsController.productDetails.img3 ??
                                    '',
                                productDetailsController.productDetails.img4 ??
                                    '',
                              ],
                            ),
                            productDetailsAppBar,
                          ],
                        ),
                        productDetails(productDetailsController.productDetails,
                            productDetailsController.availableColors),
                      ],
                    ),
                  ),
                ),
                cartToCartBottomContainer(
                  productDetailsController.productDetails,
                  productDetailsController.availableColors,
                  productDetailsController.availableSizes,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding productDetails(ProductDetails productDetails, List<String> colors) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                productDetails.product?.title ?? '',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5),
              )),
              CustomStepper(
                lowerLimit: 1,
                upperLimit: 10,
                stepValue: 1,
                value: 1,
                onChange: (newValue) {
                  quantity = newValue;
                },
              )
            ],
          ),
          Row(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.amber,
                  ),
                  Text(
                    '${productDetails.product?.star ?? 0}',
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Get.to(
                    () => ReviewListScreen(
                      productId: productDetails.productId!,
                    ),
                  );
                },
                child: Text(
                  'Reviews',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Card(
                color: AppColors.primaryColor,
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Color',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 30,
            child: SizedBox(
              height: 28,
              child: SizePicker(
                initialSelected: 0,
                onSelected: (int selectedSize) {
                  _selectedColorIndex = selectedSize;
                },
                sizes: productDetails.color?.split(',') ?? [],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 30,
            child: SizedBox(
              height: 28,
              child: SizePicker(
                initialSelected: 0,
                onSelected: (int selectedSize) {
                  _selectedSizeIndex = selectedSize;
                },
                sizes: productDetails.size?.split(',') ?? [],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            productDetails.des ?? '',
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.5),
          ),
        ],
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      leading: const BackButton(
        color: Colors.black45,
      ),
      title: const Text(
        'Product details',
        style: TextStyle(color: Colors.black54),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Container cartToCartBottomContainer(
      ProductDetails details, List<String> colors, List<String> sizes) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '\$ ${details.product?.price ?? 0}',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child:
                GetBuilder<AddToCartController>(builder: (addToCartController) {
              if (addToCartController.addToCartInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ElevatedButton(
                onPressed: () async {
                  final result = await addToCartController.addToCart(
                    details.id!,
                    colors[_selectedColorIndex].toString(),
                    sizes[_selectedSizeIndex],
                    quantity,
                  );
                  if (result) {
                    Get.snackbar(
                        'Successful', 'This product has been added to cart');
                  } else {
                    Get.snackbar(
                        'Failed', "This product couldn't be added to cart",
                        colorText: Colors.red);
                  }
                },
                child: const Text('Add to cart'),
              );
            }),
          )
        ],
      ),
    );
  }
}

/*
class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen(
      {Key? key, required this.productId, required Product product})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if (productDetailsController.getProductDetailsInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ProductImageSlider(
                              imageList: [
                                productDetailsController.productDetails.img1 ??
                                    '',
                                productDetailsController.productDetails.img2 ??
                                    '',
                                productDetailsController.productDetails.img3 ??
                                    '',
                                productDetailsController.productDetails.img4 ??
                                    ''
                              ],
                            ),
                            productDetailsAppBar,
                          ],
                        ),
                        productDetailsWidget(
                            productDetailsController.productDetails,
                            productDetailsController.availableColors),
                      ],
                    ),
                  ),
                ),
                addToCartBottomContainer(
                  productDetailsController.productDetails,
                  productDetailsController.availableColors,
                  productDetailsController.availableSizes,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding productDetailsWidget(
      ProductDetails productDetails, List<String> colors) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetails.product?.title ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              CustomStepper(
                  lowerLimit: 1,
                  upperLimit: 10,
                  stepValue: 1,
                  value: 1,
                  onChange: (newValue) {})
            ],
          ),
          Row(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 22,
                    color: Colors.amber,
                  ),
                  Text(
                    '${productDetails.product?.star ?? 0}',
                    style: TextStyle(
                      color: Colors.blueGrey.shade500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Get.to(
                    () => const ReviewListScreen(),
                  );
                },
                child: const Text(
                  'Reviews',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Card(
                color: AppColors.primaryColor,
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Icon(
                    Icons.favorite_outline,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Color',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 30,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    _selectedColorIndex = index;
                    //widget.onSelected(index);

                    if (mounted) {
                      setState(() {});
                    }
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: HexColor.fromHex(colors[index]),
                    child: _selectedColorIndex == index
                        ? const Icon(
                            Icons.done_outlined,
                            color: Colors.white,
                            size: 30,
                          )
                        : null,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          ),
          */
/*ColorPicker(
              colors: HexColor.fromHex(colors[index]),
              onSelected: (int selectIndex) {
                _selectedColorIndex = selectIndex;
              },
              initialSelected: 0,
            ),*/ /*


          const SizedBox(
            height: 16,
          ),
          const Text(
            'Sizes',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 35,
            child: SizePicker(
              initialSelected: 0,
              onSelected: (int selectIndex) {
                _selectedSizeIndex = selectIndex;
              },
              sizes: productDetails.size?.split(',') ?? [],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            productDetails.product?.shortDes ?? '',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      title: Text(
        'Product Details',
        style: TextStyle(color: Colors.grey.shade800),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Container addToCartBottomContainer(
      ProductDetails details, List<String> colors, List<String> sizes) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.20),
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
                'Price',
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
                '\$ ${details.product?.price ?? 0}',
                // details.product?.price ?? 0,
                // '\$ 1000',
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
            child: GetBuilder<AddToCartController>(
              builder: (addToCartController) {
                if (addToCartController.addToCartInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                  onPressed: () async {
                    final result = await addToCartController.addToCart(
                      details.id!,
                      colors[_selectedColorIndex].toString(),
                      sizes[_selectedSizeIndex],
                    );
                    if (result) {
                      Get.snackbar(
                          'Successful', 'This product has been added to cart');
                    } else {
                      Get.snackbar(
                          'Failed', "This product couldn't be added to cart",
                          colorText: Colors.red);
                    }
                  },
                  child: const Text('Add to Cart'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
*/
