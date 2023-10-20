import 'package:crafty_bay/data/models/profile_data.dart';

class CreateProfileModel {
  String? msg;
  ProfileData? data;

  CreateProfileModel({this.msg, this.data});

  CreateProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

