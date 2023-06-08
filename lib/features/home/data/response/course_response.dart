import 'package:acthub/features/home/data/response/attribute_course_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_response.g.dart';

@JsonSerializable()
class CourseResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'isRated')
  bool? isRated;
  @JsonKey(name: 'user_rate')
  double? userRate;
  @JsonKey(name: 'attributes')
  AttributeCourseResponse? attributeCourseResponse;

  CourseResponse(
      {this.id, this.isRated, this.userRate, this.attributeCourseResponse});

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
}
