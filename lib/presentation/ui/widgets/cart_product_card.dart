import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/cart_list_model.dart';
import '../utility/app_colors.dart';
import 'custom_stepper.dart';

class CartProductCard extends StatelessWidget {
  final CartData cartData;
  const CartProductCard({
    super.key,
    required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => ProductDetailsScreen(productId: cartData.product!.id!),
        );
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 85,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                    cartData.product?.image ?? '',
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartData.product?.title ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                  children: [
                                    TextSpan(
                                        text:
                                            'Color: ${cartData.color ?? ''} '),
                                    TextSpan(
                                        text: 'Size: ${cartData.size ?? ''}'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Deleting...'),
                                      IconButton(
                                        onPressed: (Get.back),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Delete',
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
                                      borderRadius: BorderRadius.circular(16)),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.redAccent),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${cartData.product?.price ?? ''}',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 75,
                          child: FittedBox(
                            child: CustomStepper(
                              lowerLimit: 1,
                              upperLimit: 10,
                              stepValue: 1,
                              value: 1,
                              onChange: (int value) {},
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*
class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 85,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                  '',
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'hola',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                                children: [
                                  // TextSpan(text: 'Color: ${cartData.color ?? ''} '),
                                  //TextSpan(text: 'Size: ${cartData.size ?? ''}'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Deleting...'),
                                    IconButton(
                                      onPressed: (Get.back),
                                      icon: Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                content: Text(
                                  'Are you sure?',
                                  style: TextStyle(fontSize: 18),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.redAccent),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // '\$ ${cartData.product?.price ?? ''}',
                        'hola',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 75,
                        child: FittedBox(
                          child: CustomStepper(
                            lowerLimit: 1,
                            upperLimit: 10,
                            stepValue: 1,
                            value: 1,
                            onChange: (int value) {},
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
*/
