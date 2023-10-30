import 'package:crafty_bay/data/models/create_profile_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/read_profile_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../data/utility/urls.dart';

class ProfileController extends GetxController {
  bool _profileInProgress = false;
  String _message = '';
  CompleteProfileData _completeProfileData = CompleteProfileData();
  ReadProfileData _readProfileData = ReadProfileData();

  bool get profileInProgress => _profileInProgress;
  String get message => _message;
  CompleteProfileData get completeProfileData => _completeProfileData;
  ReadProfileData get readProfileData => _readProfileData;

  Future<bool> completeProfile(
    String name,
    String address,
    String city,
    String state,
    String postCode,
    String country,
    String phone,
    String fax,
  ) async {
    _profileInProgress = true;
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
    _profileInProgress = false;
    if (response.isSuccess) {
      _completeProfileData =
          CreateProfileModel.fromJson(response.responseJson ?? {}).data!;
      return true;
    } else {
      _message = 'Failed to create profile';
      return false;
    }
  }

  Future<bool> readProfile() async {
    _profileInProgress = false;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.readProfile,
    );
    _profileInProgress = false;
    if (response.isSuccess) {
      _readProfileData =
          ReadProfileModel.fromJson(response.responseJson!).data!;
      update();
      return true;
    } else {
      _message = 'Unable to read profile data';
      return false;
    }
  }
}
