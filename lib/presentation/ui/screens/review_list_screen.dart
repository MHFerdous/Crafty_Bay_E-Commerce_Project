import 'package:crafty_bay/presentation/state_holders/review_controller.dart';
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey.shade100,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GetBuilder<ReviewListController>(builder: (reviewListController) {
                          if (reviewListController.reviewInProgress) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Column(
                            children: [
                              ListView.builder(
                                  itemCount: reviewListController.reviewListModel.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Icon(Icons.person_outline),
                                      title: Text(reviewListController.data.description ??
                                          ''),
                                    );
                                  })
                            ],
                          );
                        }),
                      ),
                    ),
                  );

              },
            ),
          ),
          addReviewBottomContainer()
        ],
      ),
    );
  }

  Container addReviewBottomContainer() {
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
          const Text(
            'Reviews (10)',
            style: TextStyle(
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
                print(widget.productId)
;                Get.to(
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

/*  Padding get reviewCard {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey.shade100,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<ReviewController>(builder: (reviewListController) {
            if (reviewListController.reviewInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                ListView.builder(
                    itemCount:
                        reviewListController.reviewListModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text(reviewListController
                                .reviewListModel.data?[index].description ??
                            ''),
                      );
                    })
              ],
            );
          }),
        ),
      ),
    );
  }*/
}
