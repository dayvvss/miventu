import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpeakerProfileRecord extends FirestoreRecord {
  SpeakerProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "job_title" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  bool hasJobTitle() => _jobTitle != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "industry" field.
  String? _industry;
  String get industry => _industry ?? '';
  bool hasIndustry() => _industry != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "linkedIn_url" field.
  String? _linkedInUrl;
  String get linkedInUrl => _linkedInUrl ?? '';
  bool hasLinkedInUrl() => _linkedInUrl != null;

  // "session" field.
  List<String>? _session;
  List<String> get session => _session ?? const [];
  bool hasSession() => _session != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _jobTitle = snapshotData['job_title'] as String?;
    _company = snapshotData['company'] as String?;
    _industry = snapshotData['industry'] as String?;
    _bio = snapshotData['bio'] as String?;
    _linkedInUrl = snapshotData['linkedIn_url'] as String?;
    _session = getDataList(snapshotData['session']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('speaker_profile');

  static Stream<SpeakerProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpeakerProfileRecord.fromSnapshot(s));

  static Future<SpeakerProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpeakerProfileRecord.fromSnapshot(s));

  static SpeakerProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpeakerProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpeakerProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpeakerProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpeakerProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpeakerProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpeakerProfileRecordData({
  String? name,
  String? jobTitle,
  String? company,
  String? industry,
  String? bio,
  String? linkedInUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'job_title': jobTitle,
      'company': company,
      'industry': industry,
      'bio': bio,
      'linkedIn_url': linkedInUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpeakerProfileRecordDocumentEquality
    implements Equality<SpeakerProfileRecord> {
  const SpeakerProfileRecordDocumentEquality();

  @override
  bool equals(SpeakerProfileRecord? e1, SpeakerProfileRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.jobTitle == e2?.jobTitle &&
        e1?.company == e2?.company &&
        e1?.industry == e2?.industry &&
        e1?.bio == e2?.bio &&
        e1?.linkedInUrl == e2?.linkedInUrl &&
        listEquality.equals(e1?.session, e2?.session);
  }

  @override
  int hash(SpeakerProfileRecord? e) => const ListEquality().hash([
        e?.name,
        e?.jobTitle,
        e?.company,
        e?.industry,
        e?.bio,
        e?.linkedInUrl,
        e?.session
      ]);

  @override
  bool isValidKey(Object? o) => o is SpeakerProfileRecord;
}
