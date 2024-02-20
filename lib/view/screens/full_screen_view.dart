import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';

class FullScreenView extends StatelessWidget {
  String imgSrc;
  FullScreenView({super.key, required this.imgSrc});

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
                image: NetworkImage(imgSrc),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: MediaQuery.of(context).size.width / 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black.withOpacity(0.6),
              ),
              child: GestureDetector(
                onTap: () {
                  AsyncWallpaper.setWallpaper(url: imgSrc,
                  errorToastDetails: ToastDetails.error(),
                  goToHome: true,
                  wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                    toastDetails: ToastDetails.success(),
                  );


                },
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
          ),
          Positioned(
            top: 55,
            left: 30,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.dangerous_rounded,
                color: Colors.grey.withOpacity(0.5),
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
