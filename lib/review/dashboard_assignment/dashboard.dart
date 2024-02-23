import 'package:digital_attendance/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
            Items item1 = new Items(
              title: "Anamika Rai",
              subtitle: "Roll no:1",
            );
            Items item2 = new Items(
              title: "Anjila Gurung",
              subtitle: "Roll no:2",
            );
            Items item3 = new Items(
              title: "Keshab Khanal",
              subtitle: "Roll no:1",
            );
            Items item4 = new Items(
              title: "Barsat Rai",
              subtitle: "Roll no:4",
            );
            Items item5 = new Items(
              title: "Chirag Kuinkel",
              subtitle: "Roll no:5",
            );
            Items item6 = new Items(
              title: "Gagan Pradhan",
              subtitle: "Roll no:6",
            );
            Items item7 = new Items(
              title: "Isan Adhikari",
              subtitle: "Roll no:7",
            );
            Items item8 = new Items(
              title: "Ishan Shrestha",
              subtitle: "Roll no:8",
            );
            Items item9 = new Items(
              title: "Kaustubh Regmi",
              subtitle: "Roll no:9",
            );
            Items item10 = new Items(
              title: "Manoj Khati",
              subtitle: "Roll no:10",
            );
            Items item11 = new Items(
              title: "Rekha ANgdembe",
              subtitle: "Roll no:11",
            );
            Items item12 = new Items(
              title: "Sanish Regmi",
              subtitle: "Roll no:1",
            );
            Items item13 = new Items(
              title: "Sanskriti Dhakal",
              subtitle: "Roll no:13",
            );
            Items item14 = new Items(
              title: "Saswat Poudel",
              subtitle: "Roll no:14",
            );
            Items item15 = new Items(
              title: "Subarna Dahal",
              subtitle: "Roll no:15",
            );
            Items item16 = new Items(
              title: "Suchit Sapkota",
              subtitle: "Roll no:16",
            );
            Items item17 = new Items(
              title: "Sudarsan Sharma",
              subtitle: "Roll no:17",
            );
            Items item18 = new Items(
              title: "Suman Pokhrel",
              subtitle: "Roll no:18",
            );

            Items item19 = new Items(
              title: "Sumip Chaudhary",
              subtitle: "Roll no:19",
            );
            Items item20 = new Items(
              title: "Utsav Krishna Shrestha",
              subtitle: "Roll no:20",
            );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: const Text("View Record"))
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  Items({required this.title, required this.subtitle});
}
