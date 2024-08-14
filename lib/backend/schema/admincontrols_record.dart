import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdmincontrolsRecord extends FirestoreRecord {
  AdmincontrolsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "versionconntrol" field.
  String? _versionconntrol;
  String get versionconntrol => _versionconntrol ?? '';
  bool hasVersionconntrol() => _versionconntrol != null;

  // "adminpasswd" field.
  String? _adminpasswd;
  String get adminpasswd => _adminpasswd ?? '';
  bool hasAdminpasswd() => _adminpasswd != null;

  // "adscontrol" field.
  bool? _adscontrol;
  bool get adscontrol => _adscontrol ?? false;
  bool hasAdscontrol() => _adscontrol != null;

  // "driveurl" field.
  String? _driveurl;
  String get driveurl => _driveurl ?? '';
  bool hasDriveurl() => _driveurl != null;

  // "sorrymsg" field.
  String? _sorrymsg;
  String get sorrymsg => _sorrymsg ?? '';
  bool hasSorrymsg() => _sorrymsg != null;

  void _initializeFields() {
    _versionconntrol = snapshotData['versionconntrol'] as String?;
    _adminpasswd = snapshotData['adminpasswd'] as String?;
    _adscontrol = snapshotData['adscontrol'] as bool?;
    _driveurl = snapshotData['driveurl'] as String?;
    _sorrymsg = snapshotData['sorrymsg'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admincontrols');

  static Stream<AdmincontrolsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdmincontrolsRecord.fromSnapshot(s));

  static Future<AdmincontrolsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdmincontrolsRecord.fromSnapshot(s));

  static AdmincontrolsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdmincontrolsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdmincontrolsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdmincontrolsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdmincontrolsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdmincontrolsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdmincontrolsRecordData({
  String? versionconntrol,
  String? adminpasswd,
  bool? adscontrol,
  String? driveurl,
  String? sorrymsg,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'versionconntrol': versionconntrol,
      'adminpasswd': adminpasswd,
      'adscontrol': adscontrol,
      'driveurl': driveurl,
      'sorrymsg': sorrymsg,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdmincontrolsRecordDocumentEquality
    implements Equality<AdmincontrolsRecord> {
  const AdmincontrolsRecordDocumentEquality();

  @override
  bool equals(AdmincontrolsRecord? e1, AdmincontrolsRecord? e2) {
    return e1?.versionconntrol == e2?.versionconntrol &&
        e1?.adminpasswd == e2?.adminpasswd &&
        e1?.adscontrol == e2?.adscontrol &&
        e1?.driveurl == e2?.driveurl &&
        e1?.sorrymsg == e2?.sorrymsg;
  }

  @override
  int hash(AdmincontrolsRecord? e) => const ListEquality().hash([
        e?.versionconntrol,
        e?.adminpasswd,
        e?.adscontrol,
        e?.driveurl,
        e?.sorrymsg
      ]);

  @override
  bool isValidKey(Object? o) => o is AdmincontrolsRecord;
}
