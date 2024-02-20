import 'package:flutter/material.dart';
import 'package:testflutter/view/screens/search_screen.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
            "Wall Paper",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

           IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextField(
              controller: _searchController,
              cursorHeight: 20,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: "Search wallpaper...",
                contentPadding: EdgeInsets.only(
                    left: 20, right: 10, top: 10, bottom: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(34),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(34),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: GestureDetector(
            onTap: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    query: _searchController.text,
                  ),
                ),
              );
            },
            child: Icon(
              Icons.search,
              size: 38,
            ),
          ),
        )
      ],
    );
  }
}