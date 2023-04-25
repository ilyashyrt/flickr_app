import 'package:flickr_app/features/photo_list/domain/models/photos_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_list_model.g.dart';

@JsonSerializable()
class PhotoList {
  Photos? photos;
  String? stat;

  PhotoList({this.photos, this.stat});

  factory PhotoList.fromJson(Map<String, dynamic> json) => _$PhotoListFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoListToJson(this);
}




