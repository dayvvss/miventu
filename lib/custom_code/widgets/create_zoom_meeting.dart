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

import 'package:your_app/zoom_api.dart';

class ZoomMeetingScreen extends StatefulWidget {
  @override
  _ZoomMeetingScreenState createState() => _ZoomMeetingScreenState();
}

class _ZoomMeetingScreenState extends State<ZoomMeetingScreen> {
  final TextEditingController _topicController = TextEditingController();
  String? _createdMeetingId;
  Map<String, dynamic>? _meetingDetails;

  void _createMeeting() async {
    final String userId = 'YOUR_USER_ID';
    final String topic = _topicController.text;

    try {
      final meeting = await createMeeting(userId, topic);
      setState(() {
        _createdMeetingId = meeting['id'];
      });
    } catch (e) {
      // Handle error
    }
  }

  void _deleteMeeting() async {
    if (_createdMeetingId != null) {
      try {
        await deleteMeeting(_createdMeetingId!);
        setState(() {
          _createdMeetingId = null;
          _meetingDetails = null;
        });
      } catch (e) {
        // Handle error
      }
    }
  }

  void _getMeeting() async {
    if (_createdMeetingId != null) {
      try {
        final meeting = await getMeeting(_createdMeetingId!);
        setState(() {
          _meetingDetails = meeting;
        });
      } catch (e) {
        // Handle error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoom Meeting'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _topicController,
              decoration: InputDecoration(
                labelText: 'Meeting Topic',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _createMeeting,
              child: Text('Create Meeting'),
            ),
            SizedBox(height: 16.0),
            if (_createdMeetingId != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Created Meeting ID: $_createdMeetingId'),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: _deleteMeeting,
                    child: Text('Delete Meeting'),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: _getMeeting,
                    child: Text('Get Meeting Details'),
                  ),
                  SizedBox(height: 16.0),
                  if (_meetingDetails != null)
                    Text('Meeting Details: ${_meetingDetails.toString()}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
