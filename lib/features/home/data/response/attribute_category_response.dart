import 'package:json_annotation/json_annotation.dart';

part 'attribute_category_response.g.dart';

@JsonSerializable()
class AttributeCategoryResponse {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'icon')
  String? icon;
  @JsonKey(name: 'banner')
  String? banner;

  AttributeCategoryResponse({
    this.name,
    this.description,
    this.icon,
    this.banner,
  });

  factory AttributeCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AttributeCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeCategoryResponseToJson(this);
}
