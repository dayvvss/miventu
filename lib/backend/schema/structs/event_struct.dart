// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventStruct extends FFFirebaseStruct {
  EventStruct({
    List<EventStruct>? eventTitle,
    List<EventStruct>? eventDescription,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _eventTitle = eventTitle,
        _eventDescription = eventDescription,
        super(firestoreUtilData);

  // "event_title" field.
  List<EventStruct>? _eventTitle;
  List<EventStruct> get eventTitle => _eventTitle ?? const [];
  set eventTitle(List<EventStruct>? val) => _eventTitle = val;
  void updateEventTitle(Function(List<EventStruct>) updateFn) =>
      updateFn(_eventTitle ??= []);
  bool hasEventTitle() => _eventTitle != null;

  // "event_description" field.
  List<EventStruct>? _eventDescription;
  List<EventStruct> get eventDescription => _eventDescription ?? const [];
  set eventDescription(List<EventStruct>? val) => _eventDescription = val;
  void updateEventDescription(Function(List<EventStruct>) updateFn) =>
      updateFn(_eventDescription ??= []);
  bool hasEventDescription() => _eventDescription != null;

  static EventStruct fromMap(Map<String, dynamic> data) => EventStruct(
        eventTitle: getStructList(
          data['event_title'],
          EventStruct.fromMap,
        ),
        eventDescription: getStructList(
          data['event_description'],
          EventStruct.fromMap,
        ),
      );

  static EventStruct? maybeFromMap(dynamic data) =>
      data is Map ? EventStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'event_title': _eventTitle?.map((e) => e.toMap()).toList(),
        'event_description': _eventDescription?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'event_title': serializeParam(
          _eventTitle,
          ParamType.DataStruct,
          true,
        ),
        'event_description': serializeParam(
          _eventDescription,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static EventStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventStruct(
        eventTitle: deserializeStructParam<EventStruct>(
          data['event_title'],
          ParamType.DataStruct,
          true,
          structBuilder: EventStruct.fromSerializableMap,
        ),
        eventDescription: deserializeStructParam<EventStruct>(
          data['event_description'],
          ParamType.DataStruct,
          true,
          structBuilder: EventStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'EventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EventStruct &&
        listEquality.equals(eventTitle, other.eventTitle) &&
        listEquality.equals(eventDescription, other.eventDescription);
  }

  @override
  int get hashCode => const ListEquality().hash([eventTitle, eventDescription]);
}

EventStruct createEventStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventStruct? updateEventStruct(
  EventStruct? event, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    event
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventStructData(
  Map<String, dynamic> firestoreData,
  EventStruct? event,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (event == null) {
    return;
  }
  if (event.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && event.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventData = getEventFirestoreData(event, forFieldValue);
  final nestedData = eventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = event.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventFirestoreData(
  EventStruct? event, [
  bool forFieldValue = false,
]) {
  if (event == null) {
    return {};
  }
  final firestoreData = mapToFirestore(event.toMap());

  // Add any Firestore field values
  event.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventListFirestoreData(
  List<EventStruct>? events,
) =>
    events?.map((e) => getEventFirestoreData(e, true)).toList() ?? [];
