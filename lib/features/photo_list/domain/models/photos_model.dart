import 'package:flickr_app/features/photo_list/domain/models/photo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photos_model.g.dart';

@JsonSerializable()
class Photos {
  int? page;
  int? perpage;
  List<Photo>? photo;

  Photos({this.page, this.perpage, this.photo});

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosToJson(this);
}
