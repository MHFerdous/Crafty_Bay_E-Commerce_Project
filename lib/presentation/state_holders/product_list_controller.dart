import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class ProductListController extends GetxController {
  bool _getProductListInProgress = false;
  ProductModel _productModel = ProductModel();
  String _message = '';

  ProductModel get productModel => _productModel;
  bool get getProductListInProgress => _getProductListInProgress;
  String get message => _message;

  Future<bool> getProductByCategory(int categoryId) async {
    _getProductListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.getProductByCategory(categoryId),
    );
    _getProductListInProgress = false;
    if (response.isSuccess) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Product list data fetching failed';
      return false;
    }
  }

  void setProducts(ProductModel productModel) {
    _productModel = productModel;
    update();
  }
}
