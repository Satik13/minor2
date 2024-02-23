import 'package:digital_attendance/assessment/record_page/editable_page.dart';
import 'package:flutter/material.dart';

class MarksScreen extends StatefulWidget {
  @override
  State createState() => new MarksScreenState();
}

class MarksScreenState extends State<MarksScreen> {
  double assessment_first = 0.0;
  double assessment_second = 0.0;
  double assessment_third = 0.0;
  double ans = 0.0;

  final TextEditingController _textControllerPhy = new TextEditingController();
  final TextEditingController _textControllerChe = new TextEditingController();
  final TextEditingController _textControllerMat = new TextEditingController();

  Widget _buildTextComposer(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new TextField(
          controller: _textControllerPhy,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            hintText: 'Assessment I marks :',
          ),
        ),
        new TextField(
          controller: _textControllerChe,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            hintText: 'Assessment II marks :',
          ),
        ),
        new TextField(
          controller: _textControllerMat,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            hintText: 'Assessment III marks :',
          ),
        ),
        new ElevatedButton(
          onPressed: () {
            _setMarks(context);
            ans = 0.0;
          },
          child: new Text('Calculate '),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: const Text("Update Table")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Assessment Marks Calculation")),
        body: new Builder(
            // Create an inner BuildContext so that the snackBar onPressed methods
            // can refer to the Scaffold with Scaffold.of().
            builder: _buildTextComposer));
  }

  void _setMarks(BuildContext context) {
    assessment_first = double.parse(_textControllerPhy.text);
    _textControllerPhy.clear();
    print(assessment_first);

    assessment_second = double.parse(_textControllerChe.text);
    _textControllerChe.clear();
    print(assessment_second);

    assessment_third = double.parse(_textControllerMat.text);
    _textControllerMat.clear();
    print(assessment_third);

    ans = assessment_first + assessment_second + assessment_third;
    ans = ans * 100 / 300.00;
    debugPrint(" ans is " + ans.toString());
    AlertDialog alert = AlertDialog(
      title: new Text('Your Result is :'),
      content: new Text(ans.toStringAsFixed(2) + " %"),
      backgroundColor: const Color.fromARGB(255, 255, 118, 118),
      actions: <Widget>[
        TextButton(
          child: Text(
            'OK',
            style: TextStyle(
              color: Colors.black, // Change text color to black
              fontSize: 16, // Increase font size to 16
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
