import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ControlsRecord extends FirestoreRecord {
  ControlsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "adscontrol" field.
  bool? _adscontrol;
  bool get adscontrol => _adscontrol ?? false;
  bool hasAdscontrol() => _adscontrol != null;

  void _initializeFields() {
    _adscontrol = snapshotData['adscontrol'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('controls');

  static Stream<ControlsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ControlsRecord.fromSnapshot(s));

  static Future<ControlsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ControlsRecord.fromSnapshot(s));

  static ControlsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ControlsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ControlsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ControlsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ControlsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ControlsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createControlsRecordData({
  bool? adscontrol,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'adscontrol': adscontrol,
    }.withoutNulls,
  );

  return firestoreData;
}

class ControlsRecordDocumentEquality implements Equality<ControlsRecord> {
  const ControlsRecordDocumentEquality();

  @override
  bool equals(ControlsRecord? e1, ControlsRecord? e2) {
    return e1?.adscontrol == e2?.adscontrol;
  }

  @override
  int hash(ControlsRecord? e) => const ListEquality().hash([e?.adscontrol]);

  @override
  bool isValidKey(Object? o) => o is ControlsRecord;
}
