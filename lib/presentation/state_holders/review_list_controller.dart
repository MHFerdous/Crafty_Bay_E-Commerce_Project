import 'package:crafty_bay/data/models/review_list_model.dart';
import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class ReviewListController extends GetxController {
  bool _getProductReviewInProgress = false;
  ReviewListModel _reviewListModel = ReviewListModel();
  String _message = '';

  ReviewListModel get reviewListModel => _reviewListModel;
  bool get getProductReviewInProgress => _getProductReviewInProgress;
  String get message => _message;

  Future<bool> reviewList(int productId) async {
    _getProductReviewInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.reviewList(productId));
    _getProductReviewInProgress = false;
    if (response.isSuccess) {
      _reviewListModel = ReviewListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Failed to fetch review list';
      update();
      return false;
    }
  }
}
