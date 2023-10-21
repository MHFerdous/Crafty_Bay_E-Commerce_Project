import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/add_to_wish_list_model.dart';
import 'package:crafty_bay/data/models/wish_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class WishListController extends GetxController {
  bool _getWishListInProgress = false;
  String _message = '';
  AddToWishListModel _addToWishListModel = AddToWishListModel();
  WishListModel _wishListModel = WishListModel();

  bool get getWishListInProgress => _getWishListInProgress;
  String get message => _message;
  AddToWishListModel get addToWishListModel => _addToWishListModel;
  WishListModel get wishListModel => _wishListModel;

  Future<bool> addToWishList(int id) async {
    _getWishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.createWishList(id),
    );
    _getWishListInProgress = false;
    if (response.isSuccess) {
      _addToWishListModel =
          AddToWishListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Failed to add to wish list! Try again.';
      return false;
    }
  }

  Future<bool> wishList() async {
    _getWishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.showWishList,
    );
    _getWishListInProgress = false;
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Failed to show wish list! Try again.';
      return false;
    }
  }

  Future<bool> deleteWishList(int id) async {
    _getWishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.deleteWishList(id),
    );
    _getWishListInProgress = false;
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
