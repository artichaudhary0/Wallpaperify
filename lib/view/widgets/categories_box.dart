import 'package:flutter/material.dart';
import 'package:testflutter/view/screens/categories_screen.dart';

class CategoriesBox extends StatelessWidget {
  String categoryName;
  String categoryImgSrc;
  CategoriesBox({super.key,
    required this.categoryImgSrc,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              catImgUrl: categoryImgSrc,
              catName: categoryName,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                categoryImgSrc,
                width: 100,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 100,
            height: 50,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              categoryName,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
