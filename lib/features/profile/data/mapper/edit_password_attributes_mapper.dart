import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/profile/data/response/edit_password_attributes_response.dart';
import 'package:acthub/features/profile/domain/model/edit_password_attributes_model.dart';

extension EditPasswordAttributesMapper on EditPasswordAttributesResponse {
  EditPasswordAttributesModel toDomain() => EditPasswordAttributesModel(
      name: this.name.onNull(),
      email: this.email.onNull(),
      phone: this.phone.onNull(),
      avatar: this.avatar.onNull());
}
