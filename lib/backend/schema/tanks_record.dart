import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TanksRecord extends FirestoreRecord {
  TanksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tankName" field.
  String? _tankName;
  String get tankName => _tankName ?? '';
  bool hasTankName() => _tankName != null;

  void _initializeFields() {
    _tankName = snapshotData['tankName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tanks');

  static Stream<TanksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TanksRecord.fromSnapshot(s));

  static Future<TanksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TanksRecord.fromSnapshot(s));

  static TanksRecord fromSnapshot(DocumentSnapshot snapshot) => TanksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TanksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TanksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TanksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TanksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTanksRecordData({
  String? tankName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tankName': tankName,
    }.withoutNulls,
  );

  return firestoreData;
}

class TanksRecordDocumentEquality implements Equality<TanksRecord> {
  const TanksRecordDocumentEquality();

  @override
  bool equals(TanksRecord? e1, TanksRecord? e2) {
    return e1?.tankName == e2?.tankName;
  }

  @override
  int hash(TanksRecord? e) => const ListEquality().hash([e?.tankName]);

  @override
  bool isValidKey(Object? o) => o is TanksRecord;
}
