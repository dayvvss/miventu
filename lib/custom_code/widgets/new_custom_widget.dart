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

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:your_app/zoom_api.dart';

class ZoomMeetingForm extends StatefulWidget {
  @override
  _ZoomMeetingFormState createState() => _ZoomMeetingFormState();
}

class _ZoomMeetingFormState extends State<ZoomMeetingForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? _createdMeetingId;
  Map<String, dynamic>? _meetingDetails;

  void _createMeeting() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final String userId = 'YOUR_USER_ID';
      final String topic = _formKey.currentState!.value['topic'];

      try {
        final meeting = await createMeeting(userId, topic);
        setState(() {
          _createdMeetingId = meeting['id'];
        });
      } catch (e) {
        // Handle error
      }
    }
  }

  void _deleteMeeting() async {
    // ... (same as before)
  }

  void _getMeeting() async {
    // ... (same as before)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoom Meeting Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderTextField(
                name: 'topic',
                decoration: InputDecoration(
                  labelText: 'Meeting Topic',
                ),
                validator: FormBuilderValidators.required(context),
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
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
