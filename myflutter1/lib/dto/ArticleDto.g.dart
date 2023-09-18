// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticleDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleDto _$ArticleDtoFromJson(Map<String, dynamic> json) => ArticleDto(
      json['id'] as int,
      json['author'] as String,
      json['chapterId'] as int,
      json['chapterName'] as String,
      json['collect'] as bool,
      json['fresh'] as bool,
      json['courseId'] as int,
      json['desc'] as String,
      json['link'] as String,
      json['niceDate'] as String,
      json['publishTime'] as int,
      json['read'] as bool,
    );

Map<String, dynamic> _$ArticleDtoToJson(ArticleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'fresh': instance.fresh,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'publishTime': instance.publishTime,
      'read': instance.read,
    };
