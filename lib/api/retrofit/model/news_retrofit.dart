import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_c20/api/retrofit/model/source_retrofit.dart';
part 'news_retrofit.g.dart';
@JsonSerializable()
class NewsRetrofit {
  @JsonKey(name: "source")
  final SourceRetrofit? source;
  @JsonKey(name: "author")
  final String? author;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "urlToImage")
  final String? urlToImage;
  @JsonKey(name: "publishedAt")
  final String? publishedAt;
  @JsonKey(name: "content")
  final String? content;

  NewsRetrofit ({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory NewsRetrofit.fromJson(Map<String, dynamic> json) {
    return _$NewsRetrofitFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NewsRetrofitToJson(this);
  }
}