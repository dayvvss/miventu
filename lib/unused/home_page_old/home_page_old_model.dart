import '/components/event_list_item/event_list_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_old_widget.dart' show HomePageOldWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageOldModel extends FlutterFlowModel<HomePageOldWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for eventListItem component.
  late EventListItemModel eventListItemModel1;
  // Model for eventListItem component.
  late EventListItemModel eventListItemModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    eventListItemModel1 = createModel(context, () => EventListItemModel());
    eventListItemModel2 = createModel(context, () => EventListItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    eventListItemModel1.dispose();
    eventListItemModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
