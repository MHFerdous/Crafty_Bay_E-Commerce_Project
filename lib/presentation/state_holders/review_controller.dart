import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/review_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class ReviewController extends GetxController {
  bool _reviewInProgress = false;
  String _message = '';
  ReviewListModel _reviewListModel = ReviewListModel();

  bool get reviewInProgress => _reviewInProgress;
  String get message => _message;
  ReviewListModel get reviewListModel => _reviewListModel;

  Future<bool> addReview(
      String description, int productId, String rating) async {
    _reviewInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.createReview,
      {
        "description": description,
        "product_id": productId,
        "rating": rating,
      },
    );
    _reviewInProgress = false;
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Failed to add review';
      return false;
    }
  }

  Future<bool> reviewList(int id) async {
    _reviewInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.reviewList(id),
    );
    _reviewInProgress = false;
    if (response.isSuccess) {
      _reviewListModel = ReviewListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Failed to fetch review list';
      return false;
    }
  }
}
