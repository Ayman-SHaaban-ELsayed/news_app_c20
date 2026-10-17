import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_c20/api/retrofit/model/news_retrofit.dart';

part 'news_response_retrofit.g.dart';

@JsonSerializable()
class NewsResponseRetrofit {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "totalResults")
  final int? totalResults;

  @JsonKey(name: "code")
  final String? code;

  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "articles")
  final List<NewsRetrofit>? articles;

  NewsResponseRetrofit({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  factory NewsResponseRetrofit.fromJson(Map<String, dynamic> json) {
    return _$NewsResponseRetrofitFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NewsResponseRetrofitToJson(this);
  }
}
