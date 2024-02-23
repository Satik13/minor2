import 'package:flutter/material.dart';

// Define an enum for image asset paths
enum ImageAssets {
  anamika,
  anjila,
  keshab,
  barsat,
  chirag,
  gagan,
  isan,
  ishan,
  kaustubh,
  manoj,
  rekha,
  sanish,
  sanskriti,
  saswat,
  subarna,
  suchit,
  sudarsan,
  suman,
  sumip,
  utsav,
}

// Define a map to map enum values to actual asset paths
Map<ImageAssets, String> imageAssetPaths = {
  ImageAssets.anamika: 'assests/images/anamika.jpg',
  ImageAssets.anjila: 'assests/images/anjila.jpg',
  ImageAssets.keshab: 'assests/images/keshab.jpg',
  ImageAssets.barsat: 'assests/images/barsat.jpg',
  ImageAssets.chirag: 'assests/images/chirag.jpg',
  ImageAssets.gagan: 'assests/images/gagan.jpg',
  ImageAssets.isan: 'assests/images/isan.jpg',
  ImageAssets.ishan: 'assests/images/ishan.jpg',
  ImageAssets.kaustubh: 'assests/images/kaustubh.jpg',
  ImageAssets.manoj: 'assests/images/manoj.jpg',
  ImageAssets.rekha: 'assests/images/rekha.jpg',
  ImageAssets.sanish: 'assests/images/sanish.jpg',
  ImageAssets.sanskriti: 'assests/images/sanskriti.jpg',
  ImageAssets.saswat: 'assests/images/saswat.jpg',
  ImageAssets.subarna: 'assests/images/subarna.jpg',
  ImageAssets.suchit: 'assests/images/suchit.jpg',
  ImageAssets.sudarsan: 'assests/images/sudarsan.jpg',
  ImageAssets.suman: 'assests/images/suman.jpg',
  ImageAssets.sumip: 'assests/images/sumip.jpg',
  ImageAssets.utsav: 'assests/images/utsav.jpg',
};

class Content {
  final ImageAssets imageAsset; // Use enum instead of string
  final Color color;

  Content(this.imageAsset, this.color);
}

List<Content> contents = [
  Content(ImageAssets.anamika, Colors.redAccent),
  Content(ImageAssets.anjila, Colors.blueAccent),
  Content(ImageAssets.keshab, Colors.teal),
  Content(ImageAssets.barsat, Colors.orange),
  Content(ImageAssets.chirag, Colors.redAccent),
  Content(ImageAssets.gagan, Colors.blueAccent),
  Content(ImageAssets.isan, Colors.teal),
  Content(ImageAssets.ishan, Colors.orange),
  Content(ImageAssets.kaustubh, Colors.redAccent),
  Content(ImageAssets.manoj, Colors.blueAccent),
  Content(ImageAssets.rekha, Colors.teal),
  Content(ImageAssets.sanish, Colors.orange),
  Content(ImageAssets.sanskriti, Colors.redAccent),
  Content(ImageAssets.saswat, Colors.blueAccent),
  Content(ImageAssets.subarna, Colors.teal),
  Content(ImageAssets.suchit, Colors.orange),
  Content(ImageAssets.sudarsan, Colors.redAccent),
  Content(ImageAssets.suman, Colors.blueAccent),
  Content(ImageAssets.sumip, Colors.teal),
  Content(ImageAssets.utsav, Colors.orange),
];

class ImageListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
      ),
      body: ListView.builder(
        itemCount: contents.length,
        itemBuilder: (context, index) {
          return ListTile(
            
            title: Column(
              // Align content to center
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor:contents[index].color,
                  radius: 200, // Set the radius as desired
                  child: Image.asset(
                    imageAssetPaths[contents[index].imageAsset]!,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
