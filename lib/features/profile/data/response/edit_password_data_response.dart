import 'package:json_annotation/json_annotation.dart';

import '../../../../config/constants.dart';
import 'edit_password_attributes_response.dart';

part 'edit_password_data_response.g.dart';

@JsonSerializable()
class EditPasswordResponseData {
  @JsonKey(name: ApiConstants.type)
  String? type;
  @JsonKey(name: ApiConstants.id)
  int? id;
  @JsonKey(name: ApiConstants.attributes)
  EditPasswordAttributesResponse? attributes;

  EditPasswordResponseData(
      {required this.type, required this.id, required this.attributes});

  factory EditPasswordResponseData.fromJson(Map<String, dynamic> json) =>
      _$EditPasswordResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$EditPasswordResponseDataToJson(this);
}
