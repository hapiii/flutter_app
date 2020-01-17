// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeUser _$HomeUserFromJson(Map<String, dynamic> json) {
  return HomeUser(json['userId'] as int, json['title'] as String,
      json['id'] as int, json['body'] as String);
}

Map<String, dynamic> _$HomeUserToJson(HomeUser instance) => <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'id': instance.id,
      'body': instance.body
    };
