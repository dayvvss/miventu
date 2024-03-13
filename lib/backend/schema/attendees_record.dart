import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendeesRecord extends FirestoreRecord {
  AttendeesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "f_name" field.
  String? _fName;
  String get fName => _fName ?? '';
  bool hasFName() => _fName != null;

  // "l_name" field.
  String? _lName;
  String get lName => _lName ?? '';
  bool hasLName() => _lName != null;

  // "job_title" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  bool hasJobTitle() => _jobTitle != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "org_name" field.
  String? _orgName;
  String get orgName => _orgName ?? '';
  bool hasOrgName() => _orgName != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "sector" field.
  String? _sector;
  String get sector => _sector ?? '';
  bool hasSector() => _sector != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _fName = snapshotData['f_name'] as String?;
    _lName = snapshotData['l_name'] as String?;
    _jobTitle = snapshotData['job_title'] as String?;
    _gender = snapshotData['gender'] as String?;
    _orgName = snapshotData['org_name'] as String?;
    _phone = snapshotData['phone'] as String?;
    _sector = snapshotData['sector'] as String?;
    _location = snapshotData['location'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attendees');

  static Stream<AttendeesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendeesRecord.fromSnapshot(s));

  static Future<AttendeesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendeesRecord.fromSnapshot(s));

  static AttendeesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendeesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendeesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendeesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendeesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendeesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendeesRecordData({
  String? email,
  String? fName,
  String? lName,
  String? jobTitle,
  String? gender,
  String? orgName,
  String? phone,
  String? sector,
  String? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'f_name': fName,
      'l_name': lName,
      'job_title': jobTitle,
      'gender': gender,
      'org_name': orgName,
      'phone': phone,
      'sector': sector,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendeesRecordDocumentEquality implements Equality<AttendeesRecord> {
  const AttendeesRecordDocumentEquality();

  @override
  bool equals(AttendeesRecord? e1, AttendeesRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.fName == e2?.fName &&
        e1?.lName == e2?.lName &&
        e1?.jobTitle == e2?.jobTitle &&
        e1?.gender == e2?.gender &&
        e1?.orgName == e2?.orgName &&
        e1?.phone == e2?.phone &&
        e1?.sector == e2?.sector &&
        e1?.location == e2?.location;
  }

  @override
  int hash(AttendeesRecord? e) => const ListEquality().hash([
        e?.email,
        e?.fName,
        e?.lName,
        e?.jobTitle,
        e?.gender,
        e?.orgName,
        e?.phone,
        e?.sector,
        e?.location
      ]);

  @override
  bool isValidKey(Object? o) => o is AttendeesRecord;
}
