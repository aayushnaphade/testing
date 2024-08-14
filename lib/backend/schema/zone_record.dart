import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ZoneRecord extends FirestoreRecord {
  ZoneRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "zoneName" field.
  String? _zoneName;
  String get zoneName => _zoneName ?? '';
  bool hasZoneName() => _zoneName != null;

  // "tankid" field.
  String? _tankid;
  String get tankid => _tankid ?? '';
  bool hasTankid() => _tankid != null;

  void _initializeFields() {
    _zoneName = snapshotData['zoneName'] as String?;
    _tankid = snapshotData['tankid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('zone');

  static Stream<ZoneRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ZoneRecord.fromSnapshot(s));

  static Future<ZoneRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ZoneRecord.fromSnapshot(s));

  static ZoneRecord fromSnapshot(DocumentSnapshot snapshot) => ZoneRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ZoneRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ZoneRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ZoneRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ZoneRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createZoneRecordData({
  String? zoneName,
  String? tankid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'zoneName': zoneName,
      'tankid': tankid,
    }.withoutNulls,
  );

  return firestoreData;
}

class ZoneRecordDocumentEquality implements Equality<ZoneRecord> {
  const ZoneRecordDocumentEquality();

  @override
  bool equals(ZoneRecord? e1, ZoneRecord? e2) {
    return e1?.zoneName == e2?.zoneName && e1?.tankid == e2?.tankid;
  }

  @override
  int hash(ZoneRecord? e) =>
      const ListEquality().hash([e?.zoneName, e?.tankid]);

  @override
  bool isValidKey(Object? o) => o is ZoneRecord;
}
