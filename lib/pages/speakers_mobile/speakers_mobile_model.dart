import '/customcomponents/sidebar_mobile/sidebar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'speakers_mobile_widget.dart' show SpeakersMobileWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SpeakersMobileModel extends FlutterFlowModel<SpeakersMobileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sidebarMobile component.
  late SidebarMobileModel sidebarMobileModel;
  // State field(s) for iuser widget.
  bool iuserHovered1 = false;
  // State field(s) for iuser widget.
  bool iuserHovered2 = false;
  // State field(s) for iuser widget.
  bool iuserHovered3 = false;
  // State field(s) for iuser widget.
  bool iuserHovered4 = false;
  // State field(s) for iuser widget.
  bool iuserHovered5 = false;
  // State field(s) for iuser widget.
  bool iuserHovered6 = false;
  // State field(s) for iuser widget.
  bool iuserHovered7 = false;
  // State field(s) for iuser widget.
  bool iuserHovered8 = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sidebarMobileModel = createModel(context, () => SidebarMobileModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sidebarMobileModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
