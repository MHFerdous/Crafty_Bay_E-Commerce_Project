import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/read_profile_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class ReadProfileController extends GetxController {
  bool _readProfileInProgress = false;
  ReadProfileModel _readProfileModel = ReadProfileModel();

  bool get readProfileInProgress => _readProfileInProgress;
  ReadProfileModel get readProfileModel => _readProfileModel;

  Future<bool> readProfile() async {
    _readProfileInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.readProfile);
    _readProfileInProgress = false;
    if (response.isSuccess) {
      _readProfileModel = ReadProfileModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      return false;
    }
  }
}
