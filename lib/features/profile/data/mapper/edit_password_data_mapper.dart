import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/profile/data/mapper/edit_password_attributes_mapper.dart';
import 'package:acthub/features/profile/domain/model/edit_password_data_model.dart';

import '../response/edit_password_data_response.dart';

extension EditPasswordDataMapper on EditPasswordResponseData {
  EditPasswordDataModel toDomain() => EditPasswordDataModel(
      type: this.type.onNull(),
      id: this.id.onNull(),
      attributes: this.attributes!.toDomain());
}
