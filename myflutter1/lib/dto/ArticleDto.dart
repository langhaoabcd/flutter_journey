import 'package:json_annotation/json_annotation.dart';

part 'ArticleDto.g.dart';

@JsonSerializable()
class ArticleDto {
  @JsonKey()
  int id;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  bool fresh;
  int courseId;
  String desc;
  String link;
  String niceDate;
  int publishTime;
  bool read = false;

  ArticleDto(
      this.id,
      this.author,
      this.chapterId,
      this.chapterName,
      this.collect,
      this.fresh,
      this.courseId,
      this.desc,
      this.link,
      this.niceDate,
      this.publishTime,
      this.read);

  factory ArticleDto.fromJson(Map<String, dynamic> map) =>
      _$ArticleDtoFromJson(map);

  Map<String, dynamic> toJson() => _$ArticleDtoToJson(this);
}
