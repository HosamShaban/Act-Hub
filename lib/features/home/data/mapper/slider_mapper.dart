import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/home/data/mapper/attribute_slider_mapper.dart';
import 'package:acthub/features/home/data/response/slider_response.dart';
import 'package:acthub/features/home/domain/model/slider_model.dart';

extension SliderMapper on SliderResponse {
  SliderModel toDomain() {
    return SliderModel(
      id: id.onNull(),
      type: type.onNull(),
      attributeModel: attributeResponse?.toDomain(),
    );
  }
}
