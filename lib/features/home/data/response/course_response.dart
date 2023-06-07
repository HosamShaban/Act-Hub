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

  CourseResponse({
    this.id,
    this.isRated,
    this.userRate,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
}
