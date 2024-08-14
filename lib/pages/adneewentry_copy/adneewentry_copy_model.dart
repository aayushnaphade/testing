import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'adneewentry_copy_widget.dart' show AdneewentryCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdneewentryCopyModel extends FlutterFlowModel<AdneewentryCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TextFieldtank widget.
  FocusNode? textFieldtankFocusNode;
  TextEditingController? textFieldtankTextController;
  String? Function(BuildContext, String?)? textFieldtankTextControllerValidator;
  String? _textFieldtankTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lopj0wl6' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '72het9qy' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textFieldtankTextControllerValidator =
        _textFieldtankTextControllerValidator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldtankFocusNode?.dispose();
    textFieldtankTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
