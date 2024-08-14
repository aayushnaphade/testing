import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShedulesRecord extends FirestoreRecord {
  ShedulesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tankname" field.
  String? _tankname;
  String get tankname => _tankname ?? '';
  bool hasTankname() => _tankname != null;

  // "zonename" field.
  String? _zonename;
  String get zonename => _zonename ?? '';
  bool hasZonename() => _zonename != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _tankname = snapshotData['tankname'] as String?;
    _zonename = snapshotData['zonename'] as String?;
    _time = snapshotData['time'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Shedules');

  static Stream<ShedulesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShedulesRecord.fromSnapshot(s));

  static Future<ShedulesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShedulesRecord.fromSnapshot(s));

  static ShedulesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShedulesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShedulesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShedulesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShedulesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShedulesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShedulesRecordData({
  String? tankname,
  String? zonename,
  String? time,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tankname': tankname,
      'zonename': zonename,
      'time': time,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShedulesRecordDocumentEquality implements Equality<ShedulesRecord> {
  const ShedulesRecordDocumentEquality();

  @override
  bool equals(ShedulesRecord? e1, ShedulesRecord? e2) {
    return e1?.tankname == e2?.tankname &&
        e1?.zonename == e2?.zonename &&
        e1?.time == e2?.time &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(ShedulesRecord? e) => const ListEquality()
      .hash([e?.tankname, e?.zonename, e?.time, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is ShedulesRecord;
}
