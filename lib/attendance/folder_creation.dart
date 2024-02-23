import 'dart:io';

import 'package:digital_attendance/attendance/record.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FolderCreationPage extends StatefulWidget {
  const FolderCreationPage({Key? key}) : super(key: key);

  @override
  _FolderCreationPageState createState() => _FolderCreationPageState();
}

class _FolderCreationPageState extends State<FolderCreationPage> {
  late TextEditingController _folderNameController;

  @override
  void initState() {
    super.initState();
    _folderNameController = TextEditingController();
  }

  @override
  void dispose() {
    _folderNameController.dispose();
    super.dispose();
  }

  Future<void> _createFolder(String folderName) async {
    final directory = await getApplicationDocumentsDirectory();
    final folderPath = '${directory.path}/$folderName';
    if (!await Directory(folderPath).exists()) {
      await Directory(folderPath).create(recursive: true);
    }
    Navigator.pop(context, folderPath); // Pop the page with the folder path
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Folder Creation Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           TextField(
              controller: _folderNameController,
              decoration: InputDecoration(
                labelText: 'Enter folder name',
                border: OutlineInputBorder(),
                // Increase font size here
                labelStyle: TextStyle(fontSize: 18), // Adjust the font size as needed
              ),
            ),

            SizedBox(height: 20),
             ElevatedButton(
                onPressed: () {
                  var attendanceRecords;
                  var studentNames;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AttendanceRecordPage(attendanceRecords: attendanceRecords,
                    studentNames: studentNames,)));
                },
                child: const Text("Create folder"))
          ],
        ),
      ),
    );
  }
}
