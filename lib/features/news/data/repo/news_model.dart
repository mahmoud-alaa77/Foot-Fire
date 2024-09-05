import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';
@JsonSerializable()
class NewsModel {

  int? totalArticles;
  List<Article>? articles;

  NewsModel({this.totalArticles, this.articles});

 factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);


 
}

@JsonSerializable()
class Article {
  String? title;
  String? description;
  String? content;
  String? url;
  String? image;
  String? publishedAt;
  Source? source;

  Article(
      {this.title,
      this.description,
      this.content,
      this.url,
      this.image,
      this.publishedAt,
      this.source});
 factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);


}

@JsonSerializable()
class Source {
  String? name;
  String? url;

  Source({this.name, this.url});

  factory Source.fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);


}