import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/create_wish_list_model.dart';
import 'package:crafty_bay/data/models/show_wish_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class WishListController extends GetxController {
  bool _wishListInProgress = false;
  String _message = '';
  CreateWishListModel _addToWishListModel = CreateWishListModel();
  ShowWishListModel _wishListModel = ShowWishListModel();

  bool get wishListInProgress => _wishListInProgress;
  String get message => _message;
  CreateWishListModel get createWishListModel => _addToWishListModel;
  ShowWishListModel get showWishListModel => _wishListModel;

  Future<bool> createWishList(int id) async {
    _wishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.createWishList(id),
    );
    _wishListInProgress = false;
    if (response.isSuccess) {
      _addToWishListModel =
          CreateWishListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Failed to add to wish list! Try again.';
      return false;
    }
  }

  Future<bool> showWishList() async {
    _wishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.showWishList,
    );
    _wishListInProgress = false;
    if (response.isSuccess) {
      _wishListModel = ShowWishListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Failed to show wish list! Try again.';
      return false;
    }
  }

  Future<bool> deleteWishList(int id) async {
    _wishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.deleteWishList(id),
    );
    _wishListInProgress = false;
    if (response.isSuccess) {
      _wishListModel.data?.removeWhere((element) => element.productId == id);
      update();
      return true;
    } else {
      _message = 'Failed to delete wish list! Try again.';
      return false;
    }
  }
}
