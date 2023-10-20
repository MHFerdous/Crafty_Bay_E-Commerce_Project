import 'package:crafty_bay/data/models/create_profile_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../data/utility/urls.dart';

class CreateProfileController extends GetxController {
  bool _createProfileInProgress = false;
  String _message = '';
  CreateProfileModel _createProfileModel = CreateProfileModel();

  bool get createProfileInProgress => _createProfileInProgress;
  String get message => _message;
  CreateProfileModel get createProfileModel => _createProfileModel;

  Future<bool> completeProfile(String firstName, String lastName, String phone,
      String city, String address) async {
    _createProfileInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.createProfile,
      {
        "firstName": firstName,
        "lastName": lastName,
        "mobile": phone,
        "city": city,
        "shippingAddress": address,
      },
    );
    _createProfileInProgress = false;
    if (response.isSuccess) {
      //CreateProfileModel.
      return true;
    } else {
      return false;
    }
  }
}
