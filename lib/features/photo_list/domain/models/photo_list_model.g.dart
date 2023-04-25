// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoList _$PhotoListFromJson(Map<String, dynamic> json) => PhotoList(
      photos: json['photos'] == null
          ? null
          : Photos.fromJson(json['photos'] as Map<String, dynamic>),
      stat: json['stat'] as String?,
    );

Map<String, dynamic> _$PhotoListToJson(PhotoList instance) => <String, dynamic>{
      'photos': instance.photos,
      'stat': instance.stat,
    };
