// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:zoomsdkplugin/zoomsdkplugin.dart';

class ZoomWindow extends StatefulWidget {
  const ZoomWindow({
    super.key,
    required this.meetingId,
    required this.meetingPassword,
    this.width,
    this.height,
  });

  final String meetingId;
  final String meetingPassword;
  final double? width;
  final double? height;

  @override
  State<ZoomWindow> createState() => _ZoomWindowState();
}

class _ZoomWindowState extends State<ZoomWindow> {
  late ZoomMeetingController _zoomMeetingController;

  @override
  void initState() {
    super.initState();
    _zoomMeetingController = ZoomMeetingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: ZoomMeetingView(
        controller: _zoomMeetingController,
        meetingOptions: ZoomMeetingOptions(
          meetingId: widget.meetingId,
          meetingPassword: widget.meetingPassword,
          meetingDisplayOptions:
              ZoomMeetingDisplayOptions.defaultDisplayOptions(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _zoomMeetingController.dispose();
    super.dispose();
  }
}
