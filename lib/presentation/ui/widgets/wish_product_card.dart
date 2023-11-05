import 'package:crafty_bay/presentation/state_holders/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/show_wish_list_model.dart';
import '../utility/app_colors.dart';

class WishProductCard extends StatefulWidget {
  final ShowWishListData showWishListData;
  const WishProductCard({
    super.key,
    required this.showWishListData,
  });

  @override
  State<WishProductCard> createState() => _WishProductCardState();
}

class _WishProductCardState extends State<WishProductCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90,
            height: 85,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                  widget.showWishListData.product?.image ?? '',
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
                              widget.showWishListData.product?.title ?? '',
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          deleteWishCard();
                        },
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.redAccent),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '\$ ${widget.showWishListData.product?.price ?? 0}',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.amber,
                          ),
                          Text(
                            ' ${widget.showWishListData.product?.star ?? 0}',
                            style: TextStyle(
                              color: Colors.blueGrey.shade500,
                              fontSize: 16,
                            ),
                          ),
                        ],
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

  Future<void> deleteWishCard() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Deleting...'),
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
                  onPressed: () {
                    Get.find<WishListController>()
                        .deleteWishList(widget.showWishListData.productId!);
                    Get.back();
                  },
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        );
      },
    );
  }
}
