// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeCategoryResponse _$AttributeCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    AttributeCategoryResponse(
      name: json['name'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      banner: json['banner'] as String?,
    );

Map<String, dynamic> _$AttributeCategoryResponseToJson(
        AttributeCategoryResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'banner': instance.banner,
    };
