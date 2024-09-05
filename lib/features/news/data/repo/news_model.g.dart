// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      totalArticles: (json['totalArticles'] as num?)?.toInt(),
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'totalArticles': instance.totalArticles,
      'articles': instance.articles,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      url: json['url'] as String?,
      image: json['image'] as String?,
      publishedAt: json['publishedAt'] as String?,
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'url': instance.url,
      'image': instance.image,
      'publishedAt': instance.publishedAt,
      'source': instance.source,
    };

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
