import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AttendanceRecordPage extends StatefulWidget {
  final List<List<bool>?>? attendanceRecords;
  final List<Object?>? studentNames; // Updated to accept null as subtype

  const AttendanceRecordPage({
    Key? key,
    required this.attendanceRecords,
    required this.studentNames,
  }) : super(key: key);

  @override
  _AttendanceRecordPageState createState() => _AttendanceRecordPageState();
}

class _AttendanceRecordPageState extends State<AttendanceRecordPage> {
  late List<List<bool>?> _updatedAttendanceRecords;

  @override
  void initState() {
    super.initState();
    _initializeAttendanceRecords();
    _loadRecordsFromFile(); // Load attendance records from file
  }

  void _initializeAttendanceRecords() {
    _updatedAttendanceRecords = List.generate(
      widget.studentNames!.length, // Ensure studentNames is not null
      (index) {
        if (widget.attendanceRecords != null &&
            index < widget.attendanceRecords!.length &&
            widget.attendanceRecords![index] != null) {
          return List<bool>.from(widget.attendanceRecords![index]!);
        } else {
          return List<bool>.filled(
              widget.studentNames!.length , false); // Provide default value
        }
      },
    );
  }

  Future<void> _loadRecordsFromFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/attendance_records.json');
      if (await file.exists()) {
        final jsonData = await file.readAsString();
        setState(() {
          _updatedAttendanceRecords = List<List<bool>?>.from(
            jsonDecode(jsonData).map<List<bool>>((record) => List<bool>.from(record)),
          );
        });
      }
    } catch (e) {
      print('Error loading attendance records: $e');
    }
  }

  Future<void> _saveRecordsToFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/attendance_records.json');
      await file.writeAsString(jsonEncode(_updatedAttendanceRecords));
    } catch (e) {
      print('Error saving attendance records: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Records'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Student')),
            DataColumn(label: Text('Status')),
          ],
          rows: List<DataRow>.generate(
            widget.studentNames!.length, // Ensure studentNames is not null
            (index) => DataRow(
              cells: [
                DataCell(
                  Text(widget.studentNames![index]?.toString() ?? ''),
                ), // Handle null value
                DataCell(
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (_updatedAttendanceRecords.length > index &&
                            _updatedAttendanceRecords[index] != null) {
                          _updatedAttendanceRecords[index]![index] =
                              !_updatedAttendanceRecords[index]![index];
                          _saveRecordsToFile(); // Save attendance records to file on tap
                        }
                      });
                    },
                    child: _updatedAttendanceRecords.length > index &&
                            _updatedAttendanceRecords[index] != null
                        ? _updatedAttendanceRecords[index]![index]? Icon(Icons.check, color: Colors.green)
                            : Icon(Icons.close, color: Colors.red)
                        : SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
