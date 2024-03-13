import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'create_speaker_profile_widget.dart' show CreateSpeakerProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CreateSpeakerProfileModel
    extends FlutterFlowModel<CreateSpeakerProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameController;
  String? Function(BuildContext, String?)? fullNameControllerValidator;
  String? _fullNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the patients full name.';
    }

    return null;
  }

  // State field(s) for age widget.
  FocusNode? ageFocusNode1;
  TextEditingController? ageController1;
  String? Function(BuildContext, String?)? ageController1Validator;
  String? _ageController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter an age for the patient.';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for age widget.
  FocusNode? ageFocusNode2;
  TextEditingController? ageController2;
  String? Function(BuildContext, String?)? ageController2Validator;
  // State field(s) for company widget.
  FocusNode? companyFocusNode;
  TextEditingController? companyController;
  String? Function(BuildContext, String?)? companyControllerValidator;
  // State field(s) for speaker_topics widget.
  FocusNode? speakerTopicsFocusNode;
  TextEditingController? speakerTopicsController;
  final speakerTopicsMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? speakerTopicsControllerValidator;
  String? _speakerTopicsControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the date of birth of the patient.';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  final emailMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for phone_number widget.
  FocusNode? phoneNumberFocusNode1;
  TextEditingController? phoneNumberController1;
  final phoneNumberMask1 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? phoneNumberController1Validator;
  // State field(s) for phone_number widget.
  FocusNode? phoneNumberFocusNode2;
  TextEditingController? phoneNumberController2;
  final phoneNumberMask2 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? phoneNumberController2Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    fullNameControllerValidator = _fullNameControllerValidator;
    ageController1Validator = _ageController1Validator;
    speakerTopicsControllerValidator = _speakerTopicsControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode?.dispose();
    fullNameController?.dispose();

    ageFocusNode1?.dispose();
    ageController1?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();

    ageFocusNode2?.dispose();
    ageController2?.dispose();

    companyFocusNode?.dispose();
    companyController?.dispose();

    speakerTopicsFocusNode?.dispose();
    speakerTopicsController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    phoneNumberFocusNode1?.dispose();
    phoneNumberController1?.dispose();

    phoneNumberFocusNode2?.dispose();
    phoneNumberController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
