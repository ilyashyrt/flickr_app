
import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class Photo {
  String? title;

  @JsonKey(name: 'url_t')
  String? urlT;

  Photo({
    this.title,
    this.urlT,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
