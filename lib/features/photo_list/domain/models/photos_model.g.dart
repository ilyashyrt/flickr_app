// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photos _$PhotosFromJson(Map<String, dynamic> json) => Photos(
      page: json['page'] as int?,
      perpage: json['perpage'] as int?,
      photo: (json['photo'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhotosToJson(Photos instance) => <String, dynamic>{
      'page': instance.page,
      'perpage': instance.perpage,
      'photo': instance.photo,
    };
