import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

/// Cette classe permet de convertir automatiquement les champs `Timestamp`
/// de Firestore en objets `DateTime` (et inversement) lors de la (dé)sérialisation JSON.
///
/// Elle est utile lorsqu’on utilise `json_serializable` pour transformer des objets
/// Dart vers Firestore (ou depuis Firestore) sans devoir gérer manuellement
/// la conversion des dates.
class FirestoreTimestampConverter implements JsonConverter<DateTime, Object?> {
  const FirestoreTimestampConverter();

  @override
  DateTime fromJson(Object? json) {
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.parse(json);
    throw ArgumentError('Invalid Firestore timestamp: $json');
  }

  @override
  Object? toJson(DateTime date) => Timestamp.fromDate(date);
}
