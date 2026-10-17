// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response_retrofit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponseRetrofit _$NewsResponseRetrofitFromJson(
  Map<String, dynamic> json,
) => NewsResponseRetrofit(
  status: json['status'] as String?,
  totalResults: (json['totalResults'] as num?)?.toInt(),
  articles: (json['articles'] as List<dynamic>?)
      ?.map((e) => NewsRetrofit.fromJson(e as Map<String, dynamic>))
      .toList(),
  code: json['code'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$NewsResponseRetrofitToJson(
  NewsResponseRetrofit instance,
) => <String, dynamic>{
  'status': instance.status,
  'totalResults': instance.totalResults,
  'code': instance.code,
  'message': instance.message,
  'articles': instance.articles,
};
