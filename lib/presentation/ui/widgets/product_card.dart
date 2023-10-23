import 'package:crafty_bay/presentation/state_holders/add_to_wish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/product.dart';
import '../utility/app_colors.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isTap = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.to(
          ProductDetailsScreen(
            //product: product,
            productId: widget.product.id!,
          ),
        );
      },
      child: Card(
        shadowColor: AppColors.primaryColor.withOpacity(0.2),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: 120,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.product.image ?? ''),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                color: AppColors.primaryColor.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Text(
                        widget.product.title ?? '',
                        maxLines: 1,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey.shade600,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            '\$ ${widget.product.price ?? 0}',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber,
                              ),
                              Text(
                                '${widget.product.star ?? 0}',
                                style: TextStyle(
                                  color: Colors.blueGrey.shade500,
                                ),
                              ),
                              GetBuilder<WishListController>(
                                builder: (wishListController) {
                                  return InkWell(
                                    onTap: () async {
                                      final result = await wishListController
                                          .addToWishList(widget.product.id!);
                                      if (result) {
                                        Get.snackbar('Successful',
                                            'This product has been added to wish list');
                                      } else {
                                        Get.snackbar('Failed',
                                            "This product couldn't be added to wish list",
                                            colorText: Colors.red);
                                      }
                                      if (result) {}
                                    },
                                    child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: IconButton(
                                          iconSize: 16,
                                          onPressed: () {
                                            _isTap = !_isTap;
                                            setState(() {});
                                          },
                                          style: IconButton.styleFrom(),
                                          icon: Icon(
                                            Icons.favorite_outline,
                                            color: _isTap
                                                ? Colors.red
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
