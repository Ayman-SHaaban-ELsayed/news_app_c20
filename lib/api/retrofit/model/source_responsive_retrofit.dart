import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_c20/api/retrofit/model/source_retrofit.dart';

part 'source_responsive_retrofit.g.dart';

@JsonSerializable()
class SourceResponsiveRetrofit {
  @JsonKey(name: "status")
  final String? status;

  @JsonKey(name: "code")
  final String? code;

  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "sources")
  final List<SourceRetrofit>? sources;

  SourceResponsiveRetrofit({
    this.status, this.sources,
    this.code, this.message
  });

  factory SourceResponsiveRetrofit.fromJson(Map<String, dynamic> json) {
    return _$SourceResponsiveRetrofitFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SourceResponsiveRetrofitToJson(this);
  }
}
