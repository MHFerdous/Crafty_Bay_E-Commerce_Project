import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class PopularProductController extends GetxController {
  bool _getPopularProductsInProgress = false;
  ProductModel _popularProductModel = ProductModel();
  String _errorMessage = '';

  bool get getPopularProductsInProgress => _getPopularProductsInProgress;
  ProductModel get popularProductModel => _popularProductModel;
  String get errorMessage => _errorMessage;

  Future<bool> getPopularProducts() async {
    _getPopularProductsInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.getProductsByRemarks('popular'),
    );
    _getPopularProductsInProgress = false;
    if (response.isSuccess) {
      _popularProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Popular product fetching failed. Try again';
      update();
      return false;
    }
  }
}
