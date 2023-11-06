import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../data/models/network_response.dart';
import '../../data/models/read_profile_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class ReadProfileController extends GetxController {
  bool _readProfileInProfile = false;
  String _message = '';
  ReadProfileModel _readProfileModel = ReadProfileModel();

  bool get readProfileInProgress => _readProfileInProfile;
  String get message => _message;
  ReadProfileModel get readProfileModel => _readProfileModel;

  Future<bool> readProfileData() async {
    _readProfileInProfile = true;
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.readProfile);
    if (response.isSuccess) {
      _readProfileModel =
          ReadProfileModel.fromJson(response.responseJson ?? {});
      return true;
    } else {
      _message = 'Read profile data fetch failed!';
      return false;
    }
  }
}
