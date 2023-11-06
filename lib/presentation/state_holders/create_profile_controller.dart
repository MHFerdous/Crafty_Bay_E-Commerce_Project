import 'package:crafty_bay/data/models/create_profile_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../data/utility/urls.dart';

class CreateProfileController extends GetxController {
  bool _createProfileInProgress = false;
  String _message = '';
  CreateProfileData _createProfileData = CreateProfileData();

  bool get createProfileInProgress => _createProfileInProgress;
  String get message => _message;
  CreateProfileData get completeProfileData => _createProfileData;

  Future<bool> createProfile(
    String name,
    String address,
    String city,
    String state,
    String postCode,
    String country,
    String phone,
    String fax,
  ) async {
    _createProfileInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.createProfile,
      {
        "cus_name": name,
        "cus_add": address,
        "cus_city": city,
        "cus_state": state,
        "cus_postcode": postCode,
        "cus_country": country,
        "cus_phone": phone,
        "cus_fax": fax,
        "ship_name": name,
        "ship_add": address,
        "ship_city": city,
        "ship_state": state,
        "ship_postcode": postCode,
        "ship_country": country,
        "ship_phone": phone,
      },
    );
    _createProfileInProgress = false;
    if (response.isSuccess) {
      _createProfileData =
          CreateProfileModel.fromJson(response.responseJson ?? {}).data!;
      return true;
    } else {
      _message = 'Failed to create profile';
      return false;
    }
  }
}
