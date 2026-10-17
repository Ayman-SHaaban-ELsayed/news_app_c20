// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_retrofit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceRetrofit _$SourceRetrofitFromJson(Map<String, dynamic> json) =>
    SourceRetrofit(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      category: json['category'] as String?,
      language: json['language'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$SourceRetrofitToJson(SourceRetrofit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'category': instance.category,
      'language': instance.language,
      'country': instance.country,
    };
