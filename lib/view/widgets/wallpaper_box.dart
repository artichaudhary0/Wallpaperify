import 'package:flutter/material.dart';

class WallPaperWidget extends StatelessWidget {
  String imgScr;
  WallPaperWidget({
    super.key,
    required this.imgScr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.black26,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.network(
          imgScr,
          width: 100,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
