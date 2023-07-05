import 'package:acthub/features/courses/domain/entity/course_details_entity.dart';
import 'package:acthub/features/courses/domain/mapper/course_details_data_mapper.dart';
import 'package:acthub/features/courses/presentation/model/course_details_model.dart';

extension CourseDetailsMapper on CourseDetailsEntity {
  CourseDetailsModel toDomain() {
    return CourseDetailsModel(
      courseDetailsDataModel: courseDetailsDataEntity?.toDomain(),
    );
  }
}
