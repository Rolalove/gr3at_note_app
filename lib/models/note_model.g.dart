// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
  title: json['title'] as String,
  description: json['description'] as String,
  createdAt: Note._fromTimestamp(json['createdAt']),
);

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'createdAt': Note._toTimestamp(instance.createdAt),
};
