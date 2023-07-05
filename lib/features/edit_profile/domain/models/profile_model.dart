import 'package:acthub/features/edit_profile/domain/models/profile_attributes_model.dart';

import '../../../../core/base_model/base_response.dart';

class ProfileModel extends BaseModel {
  ProfileModelData data;

  ProfileModel({required this.data, required super.message});
}

class ProfileModelData {
  String type;
  int id;
  ProfileAttributesModel attributes;

  ProfileModelData({
    required this.type,
    required this.id,
    required this.attributes,
  });
}
