import 'package:crafty_bay/data/models/complete_profile_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../data/utility/urls.dart';

class CompleteProfileController extends GetxController {
  bool _completeProfileInProgress = false;
  String _message = '';
  CompleteProfileModel _completeProfileModel = CompleteProfileModel();

  bool get completeProfileInProgress => _completeProfileInProgress;
  String get message => _message;
  CompleteProfileModel get completeProfileModel => _completeProfileModel;

  Future<bool> completeProfile(String firstName, String lastName, String phone,
      String city, String address) async {
    _completeProfileInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.completeProfile,
      {
        "firstName": firstName,
        "lastName": lastName,
        "mobile": phone,
        "city": city,
        "shippingAddress": address,
      },
    );
    _completeProfileInProgress = false;
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
