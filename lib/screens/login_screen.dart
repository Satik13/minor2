import 'package:digital_attendance/dashboard/drawer.dart';
import 'package:digital_attendance/palatte.dart';
import 'package:digital_attendance/widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  static String routeName = 'LoginScreen';

  // Define a list of approved usernames
  final List<String> approvedUsernames = [
    'kreg123',
    'satik2022',
    'leduop_taswas01'
  ];
  final List<String> approvedPassword = [
    'ReGMI22@',
    'Dhakal@123',
    'leduop@2024'
  ];

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insert_record(BuildContext context) async {
    if (approvedUsernames.contains(name.text) &&
        approvedPassword.contains(password.text)) {
       Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DrawerLayoutWidget()));
      
    } else {
       showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text(
      "Invalid Credentials",
      style: TextStyle(color: Colors.black), // Set the title text color to black
    ),
    content: Text(
      "Please enter a valid username and password.",
      style: TextStyle(color: Colors.black), // Set the content text color to black
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          "OK",
          style: TextStyle(color: Colors.black), // Set the button text color to black
        ),
      ),
    ],
  ),
);

       
        name.text = "";
      password.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          key: GlobalKey(debugLabel: 'inputText'),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: Center(
                      child: Text(
                        'TEACHERS LOGIN',
                        textAlign: TextAlign.center,
                        style: kHeading,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(FontAwesomeIcons.solidEnvelope),
                                hintText: 'Username',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              controller:
                                  name, // assuming you have nameController
                              key: GlobalKey(
                                  debugLabel:
                                      'usernameInput'), // Unique key for username input
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(FontAwesomeIcons.lock),
                                hintText: 'Password',
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              key: GlobalKey(debugLabel: 'passwordInput'),
                              controller:
                                  password, // Unique key for password input
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  insert_record(context);
                                  },
                                child: const Text("Login")),
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom:
                                    BorderSide(color: Colors.white, width: 1),
                              )),
                              child: Text(
                                'Welcome to digital classroom,Technical educationalists',
                                textAlign: TextAlign.center,
                                style: kBodyText,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
