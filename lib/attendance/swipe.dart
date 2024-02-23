import 'package:digital_attendance/attendance/folder_creation.dart';
import 'package:flutter/material.dart';
import 'package:digital_attendance/attendance/content.dart';
import 'package:digital_attendance/attendance/record.dart'; // Import the AttendanceRecordPage
import 'package:swipe_cards/swipe_cards.dart';

class SwipeCardPage extends StatefulWidget {
  const SwipeCardPage({Key? key}) : super(key: key);

  @override
  State<SwipeCardPage> createState() => _SwipeCardPageState();
}

class _SwipeCardPageState extends State<SwipeCardPage> {
  late MatchEngine _matchEngine;
  late List<SwipeItem> _swipeItems;
  late bool _isNoItem = false;

  // Keep track of the current student and their attendance
  int _currentStudentIndex = 0;
  List<bool> attendanceRecords = [];
  List<String> studentNames = [
    'Anamika Rai',
    'Anjila Gurung',
    'Keshab Khanal',
    'Barsat Rai',
    'Chirag Kuinkel',
    'Gagan Pradhan',
    'Isan Adhikari',
    'Ishan Shrestha',
    'Kaustubh Regmi',
    'Manoj Khati',
    'Rekha Angdembe',
    'Sanish Regmi',
    'Sanskriti Dhakal',
    'Saswat Poudel',
    'Subarna Dahal',
    'Suchit Sapkota',
    'Sudarshan Sharma',
    'Suman Pokhrel',
    'Sumip Chaudhary',
    'Utsav Krishna Shrestha'
    // Add more student names as needed
  ];

  void reset() {
    _swipeItems = [];
    for (var content in contents) {
      var swipeItem = SwipeItem(
        content: content,
      );
      _swipeItems.add(swipeItem);
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    _isNoItem = false;
    _currentStudentIndex = 0;
    attendanceRecords.clear();
  }

  @override
  void initState() {
    reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FolderCreationPage(
                  ),
                ),
              );
            },
            child: const Text("Record Attendance"),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                reset();
              });
            },
            icon: const Icon(Icons.restore),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: _isNoItem
            ? const Center(
                child: Text('Attendance Completed'),
              )
            : Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: 60),
                    child: SwipeCards(
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: contents[index].color,
                                radius: 200,
                                child: Image.asset(
                                  imageAssetPaths[contents[index]
                                      .imageAsset]!, // Retrieve image path using enum value
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          color: contents[index].color,
                        );
                      },
                      matchEngine: _matchEngine,
                      onStackFinished: () {
                        print('onStackFinished');
                        setState(() {
                          _isNoItem = true;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          _matchEngine.currentItem!.nope();
                          // Mark current student as absent
                          attendanceRecords.add(false);
                          _currentStudentIndex++;
                        },
                        child: const Icon(Icons.close),
                        backgroundColor: Colors.red,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _matchEngine.currentItem!.like();
                          // Mark current student as present
                          attendanceRecords.add(true);
                          _currentStudentIndex++;
                        },
                        child: const Icon(Icons.check),
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
