import 'package:crafty_bay/data/models/create_review_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class CreateReviewController extends GetxController {
  bool _createReviewInProgress = false;
  String _message = '';
  CreateReviewListModel _createReviewListModel = CreateReviewListModel();

  bool get createReviewInProgress => _createReviewInProgress;
  String get message => _message;
  CreateReviewListModel get createReviewListModel => _createReviewListModel;

  Future<bool> addReview(
      String description, int productId, String rating) async {
    _createReviewInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.createReview,
      {
        "description": description,
        "product_id": productId,
        "rating": int.tryParse(rating),
      },
    );
    _createReviewInProgress = false;
    update();
    if (response.isSuccess) {
      _createReviewListModel =
          CreateReviewListModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'Failed to add review';
      return false;
    }
  }
}
