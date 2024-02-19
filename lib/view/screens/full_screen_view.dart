import 'package:flutter/material.dart';

class FullScreenView extends StatelessWidget {
  String imgSrc;
  FullScreenView({super.key, required this.imgSrc});

  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // Future<void> setWallpaperFromFile(
  //     String wallpaperUrl, BuildContext context) async {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text("Downloading Started...")));
  //   try {
  //     // Saved with this method.
  //     var imageId = await ImageDownloader.downloadImage(wallpaperUrl);
  //     if (imageId == null) {
  //       return;
  //     }
  //     // Below is a method of obtaining saved image information.
  //     var fileName = await ImageDownloader.findName(imageId);
  //     var path = await ImageDownloader.findPath(imageId);
  //     var size = await ImageDownloader.findByteSize(imageId);
  //     var mimeType = await ImageDownloader.findMimeType(imageId);
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Downloaded Sucessfully"),
  //       // action: SnackBarAction(
  //       //     label: "Open",
  //       //     onPressed: () {
  //       //       OpenFile.open(path);
  //       //     }),
  //     ));
  //     print("IMAGE DOWNLOADED");
  //   } on PlatformException catch (error) {
  //     print(error);
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Error Occured - $error")));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [


          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgSrc), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 50,
            left: MediaQuery.of(context).size.width / 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black.withOpacity(0.6),
              ),
              child: const Text(
                "Set Wallpaper",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
