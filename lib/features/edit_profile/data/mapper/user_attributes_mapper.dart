import 'package:acthub/core/extensions/extensions.dart';

import '../../domain/models/user_attributes_model.dart';
import '../response/user_attributes_response.dart';

extension UserAttributesMapper on UserAttributesResponse {
  UserAttributesModel toDomain() {
    return UserAttributesModel(
      name: name.onNull(),
      phone: phone.onNull(),
      email: email.onNull(),
    );
  }
}

extension AttributesUserMapper on AttributesUserResponse {
  AttributesUserModel toDomain() {
    return AttributesUserModel(attributes: attributes?.toDomain());
  }
}
