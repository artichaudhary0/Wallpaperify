import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:testflutter/model/categories_model.dart';
import 'package:testflutter/model/wallpaper_model.dart';

class ApiOperation {
  List<WallPaperModel> wallpapers = [];
  List<WallPaperModel> searchWallpaper = [];
  List<CategoryModel> cateogryModelList = [];
  Future<List<WallPaperModel>> getWallpaper() async {
    Response response =
        await get(Uri.parse("https://api.pexels.com/v1/curated/"), headers: {
      "Authorization":
          "gwm9kt63aaRHh1z4gVfO5WcflsY2DzuBaCykXTrLsjQt9ckwkgmPUTOP"
    });
    Map<String, dynamic> json = jsonDecode(response.body);
    List photos = json["photos"];

    photos.forEach((element) {
      wallpapers.add(
        WallPaperModel.fromJson(element),
      );
    });

    return wallpapers;
  }

  Future<List<WallPaperModel>> getSearchWallpaper( String query)async
  {
    Response response =
    await get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=1000&per_page=1"), headers: {
      "Authorization":
      "gwm9kt63aaRHh1z4gVfO5WcflsY2DzuBaCykXTrLsjQt9ckwkgmPUTOP"
    });
    Map<String, dynamic> json = jsonDecode(response.body);
    List photos = json["photos"];
    searchWallpaper.clear();
    photos.forEach((element) {

      searchWallpaper.add(
        WallPaperModel.fromJson(element),
      );
      print(searchWallpaper);
    });


    return searchWallpaper;
  }
  Future<List<CategoryModel>> getCategoriesList() async {
    List<CategoryModel> categoryModelList = [];
    List<String> categoryName = [
      "Cars",
      "Nature",
      "Bikes",
      "Street",
      "City",
      "Flowers"
    ];

    // Iterate through each category name
    for (String catName in categoryName) {
      final _random = Random();

      List<WallPaperModel> photos = await getSearchWallpaper(catName);

      if (photos.isNotEmpty) {

        WallPaperModel photoModel = photos[_random.nextInt(photos.length)];

        categoryModelList.add(CategoryModel(catImgUrl: photoModel.imgScr, catName: catName));
      }
    }

    return categoryModelList;
  }

}

