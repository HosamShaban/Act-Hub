import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/courses/domain/entity/course_details_data_entity.dart';
import 'package:acthub/features/courses/domain/mapper/course_details_data_attribute_mapper.dart';
import 'package:acthub/features/courses/presentation/model/course_details_data_model.dart';

extension CourseDetailsDataMapper on CourseDetailsDataEntity {
  CourseDetailsDataModel toDomain() {
    return CourseDetailsDataModel(
      id: id.onNull(),
      isRate: isRate.onNull(),
      userRate: userRate.onNull(),
      courseDetailsDataAttributeModel:
          courseDetailsDataAttributeEntity?.toDomain(),
    );
  }
}
