import 'package:crafty_bay/data/models/product_details.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/color_extension.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/product.dart';
import '../utility/app_colors.dart';
import '../widgets/home/product_image_slider.dart';
import '../widgets/size_picker.dart';

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
                        productDetails(productDetailsController.productDetails,
                            productDetailsController.availableColors),
                      ],
                    ),
                  ),
                ),
                addToCartBottomContainer(
                    productDetailsController.productDetails),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding productDetails(ProductDetails productDetails, List<String> colors) {
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
                onPressed: () {},
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
                        ? CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            child: const Icon(
                              Icons.done_outlined,
                              color: Colors.white,
                            ),
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
          /*ColorPicker(
              colors: HexColor.fromHex(colors[index]),
              onSelected: (int selectIndex) {
                _selectedColorIndex = selectIndex;
              },
              initialSelected: 0,
            ),*/

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
              onSelected: (int selectIndex) {},
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

  Container addToCartBottomContainer(ProductDetails productDetails) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
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
                '\$ ${productDetails.product?.price ?? 0}',
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
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          )
        ],
      ),
    );
  }
}
