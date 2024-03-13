import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "event_location" field.
  String? _eventLocation;
  String get eventLocation => _eventLocation ?? '';
  bool hasEventLocation() => _eventLocation != null;

  // "event_description" field.
  String? _eventDescription;
  String get eventDescription => _eventDescription ?? '';
  bool hasEventDescription() => _eventDescription != null;

  // "event_image" field.
  String? _eventImage;
  String get eventImage => _eventImage ?? '';
  bool hasEventImage() => _eventImage != null;

  // "sponsors_logos" field.
  List<String>? _sponsorsLogos;
  List<String> get sponsorsLogos => _sponsorsLogos ?? const [];
  bool hasSponsorsLogos() => _sponsorsLogos != null;

  // "unique_id" field.
  String? _uniqueId;
  String get uniqueId => _uniqueId ?? '';
  bool hasUniqueId() => _uniqueId != null;

  // "event_date" field.
  String? _eventDate;
  String get eventDate => _eventDate ?? '';
  bool hasEventDate() => _eventDate != null;

  // "attendees" field.
  List<String>? _attendees;
  List<String> get attendees => _attendees ?? const [];
  bool hasAttendees() => _attendees != null;

  // "speakers" field.
  List<String>? _speakers;
  List<String> get speakers => _speakers ?? const [];
  bool hasSpeakers() => _speakers != null;

  // "event_imag_url" field.
  String? _eventImagUrl;
  String get eventImagUrl => _eventImagUrl ?? '';
  bool hasEventImagUrl() => _eventImagUrl != null;

  // "sponsors" field.
  List<String>? _sponsors;
  List<String> get sponsors => _sponsors ?? const [];
  bool hasSponsors() => _sponsors != null;

  void _initializeFields() {
    _eventName = snapshotData['event_name'] as String?;
    _eventLocation = snapshotData['event_location'] as String?;
    _eventDescription = snapshotData['event_description'] as String?;
    _eventImage = snapshotData['event_image'] as String?;
    _sponsorsLogos = getDataList(snapshotData['sponsors_logos']);
    _uniqueId = snapshotData['unique_id'] as String?;
    _eventDate = snapshotData['event_date'] as String?;
    _attendees = getDataList(snapshotData['attendees']);
    _speakers = getDataList(snapshotData['speakers']);
    _eventImagUrl = snapshotData['event_imag_url'] as String?;
    _sponsors = getDataList(snapshotData['sponsors']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? eventName,
  String? eventLocation,
  String? eventDescription,
  String? eventImage,
  String? uniqueId,
  String? eventDate,
  String? eventImagUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_name': eventName,
      'event_location': eventLocation,
      'event_description': eventDescription,
      'event_image': eventImage,
      'unique_id': uniqueId,
      'event_date': eventDate,
      'event_imag_url': eventImagUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.eventName == e2?.eventName &&
        e1?.eventLocation == e2?.eventLocation &&
        e1?.eventDescription == e2?.eventDescription &&
        e1?.eventImage == e2?.eventImage &&
        listEquality.equals(e1?.sponsorsLogos, e2?.sponsorsLogos) &&
        e1?.uniqueId == e2?.uniqueId &&
        e1?.eventDate == e2?.eventDate &&
        listEquality.equals(e1?.attendees, e2?.attendees) &&
        listEquality.equals(e1?.speakers, e2?.speakers) &&
        e1?.eventImagUrl == e2?.eventImagUrl &&
        listEquality.equals(e1?.sponsors, e2?.sponsors);
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.eventName,
        e?.eventLocation,
        e?.eventDescription,
        e?.eventImage,
        e?.sponsorsLogos,
        e?.uniqueId,
        e?.eventDate,
        e?.attendees,
        e?.speakers,
        e?.eventImagUrl,
        e?.sponsors
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
