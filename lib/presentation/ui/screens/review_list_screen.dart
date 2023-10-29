import 'package:crafty_bay/presentation/ui/screens/add_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/review_list_controller.dart';
import '../utility/app_colors.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key, required this.productId});
  final int productId;

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ReviewListController>().reviewList(widget.productId);
    });
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
          'Reviews',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<ReviewListController>().reviewList(widget.productId);
        },
        child: GetBuilder<ReviewListController>(
          builder: (reviewListController) {
            if (reviewListController.getProductReviewInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (reviewListController.reviewListModel.data?.isEmpty ?? true) {
              return const Center(
                child: Text('Nothing to show'),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        reviewListController.reviewListModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  reviewListController
                                                          .reviewListModel
                                                          .data?[index]
                                                          .profile
                                                          ?.cusName ??
                                                      '',
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  reviewListController
                                                          .reviewListModel
                                                          .data?[index]
                                                          .description ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
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
                      );
                    },
                  ),
                ),
                addReviewContainer(reviewListController)
              ],
            );
          },
        ),
      ),
    );
  }

  Container addReviewContainer(ReviewListController reviewListController) {
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
          Text(
            'Reviews (${reviewListController.reviewListModel.data?.length ?? 0})',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primaryColor,
            child: IconButton(
              onPressed: () {
                Get.to(
                  () => AddReviewScreen(
                    productId: widget.productId,
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
