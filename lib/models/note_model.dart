import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable()
class Note {
  final String title;
  final String description;
  @JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp)
  final Timestamp? createdAt;

  Note({required this.title, required this.description, this.createdAt});

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  // Converters to handle Firestore `Timestamp` when serializing/deserializing
  static Timestamp? _fromTimestamp(Object? ts) =>
      ts == null ? null : ts as Timestamp;
  static Object? _toTimestamp(Timestamp? ts) => ts;
}
