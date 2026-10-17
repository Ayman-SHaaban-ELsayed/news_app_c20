// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_responsive_retrofit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceResponsiveRetrofit _$SourceResponsiveRetrofitFromJson(
  Map<String, dynamic> json,
) => SourceResponsiveRetrofit(
  status: json['status'] as String?,
  sources: (json['sources'] as List<dynamic>?)
      ?.map((e) => SourceRetrofit.fromJson(e as Map<String, dynamic>))
      .toList(),
  code: json['code'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$SourceResponsiveRetrofitToJson(
  SourceResponsiveRetrofit instance,
) => <String, dynamic>{
  'status': instance.status,
  'code': instance.code,
  'message': instance.message,
  'sources': instance.sources,
};
