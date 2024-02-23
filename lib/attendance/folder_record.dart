import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class FolderRecordsPage extends StatefulWidget {
  final String folderPath;
  final String fileName;

  const FolderRecordsPage({
    Key? key,
    required this.folderPath,
    required this.fileName,
  }) : super(key: key);

  @override
  _FolderRecordsPageState createState() => _FolderRecordsPageState();
}

class _FolderRecordsPageState extends State<FolderRecordsPage> {
  late List<bool> _attendanceRecords;

  @override
  void initState() {
    super.initState();
    _loadRecordsFromFile();
  }

  Future<void> _loadRecordsFromFile() async {
    final file = File('${widget.folderPath}/${widget.fileName}');
    if (await file.exists()) {
      final jsonData = await file.readAsString();
      setState(() {
        _attendanceRecords = List<bool>.from(jsonDecode(jsonData));
      });
    } else {
      setState(() {
        _attendanceRecords = [];
      });
    }
  }

  Future<void> _saveRecordsToFile() async {
    final file = File('${widget.folderPath}/${widget.fileName}');
    await file.writeAsString(jsonEncode(_attendanceRecords));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Folder Records'),
        actions: [
          IconButton(
            onPressed: () async {
              await _saveRecordsToFile();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Records saved successfully'),
                ),
              );
            },
            icon: Icon(Icons.save),
            tooltip: 'Save Records',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _attendanceRecords.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Record ${index + 1}'),
            subtitle: Text(_attendanceRecords[index] ? 'Present' : 'Absent'),
            onTap: () {
              setState(() {
                _attendanceRecords[index] = !_attendanceRecords[index];
              });
            },
          );
        },
      ),
    );
  }
}
