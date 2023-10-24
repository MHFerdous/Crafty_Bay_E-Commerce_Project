import 'package:crafty_bay/presentation/state_holders/review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key, required this.productId});
  final int productId;

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final TextEditingController _ratingTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Create Review',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              TextFormField(
                controller: _ratingTEController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Review',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
                validator: (String? value) {
                  if ((value?.isEmpty ?? true) || value!.length > 100) {
                    return 'Enter review (0-100)';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _descriptionTEController,
                maxLines: 5,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Description',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
                validator: (String? value) {
                  if ((value?.isEmpty ?? true)) {
                    return 'Enter description';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: GetBuilder<ReviewController>(
                    builder: (addReviewController) {
                  if (addReviewController.reviewInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final result = await addReviewController.addReview(
                          _descriptionTEController.text.trim(),
                          widget.productId,
                          _ratingTEController.text.trim(),
                        );
                        if (result) {
                          Get.snackbar(
                              'Successful!', 'review has been created');

                          Get.back();
                        } else {
                          Get.snackbar('Failed!', "Review couldn't be created",
                              colorText: Colors.red);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Submit'),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
