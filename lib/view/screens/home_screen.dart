import 'package:flutter/material.dart';
import 'package:testflutter/controllers/api_operation.dart';
import 'package:testflutter/model/categories_model.dart';
import 'package:testflutter/model/wallpaper_model.dart';
import 'package:testflutter/view/screens/full_screen_view.dart';
import 'package:testflutter/view/widgets/categories_box.dart';
import 'package:testflutter/view/widgets/search_box.dart';
import 'package:testflutter/view/widgets/wallpaper_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WallPaperModel> wallPaper = [];
  List<CategoryModel> categoryModelList = [];
  ApiOperation apiOperation = ApiOperation();
  final TextEditingController _searchController = TextEditingController();

  getCategoryDetails() async {
    categoryModelList = await ApiOperation().getCategoriesList();
    setState(() {
      categoryModelList = categoryModelList;
    });
  }

  getWallPaper() async {
    wallPaper = await apiOperation.getWallpaper();
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  void initState() {
    getWallPaper();
    getCategoryDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: const Text(
                "Wall Paper",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SearchBox(searchController: _searchController),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.only(left: 15.0),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categoryModelList.length,
                itemBuilder: ((context, index) => CategoriesBox(
                      categoryImgSrc: categoryModelList[index].catImgUrl,
                      categoryName: categoryModelList[index].catName,
                    )),
              ),
            ),
             Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0),
                child: GridView.builder(
                  physics:const AlwaysScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 300,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: wallPaper.length,
                  itemBuilder: (context, index) {
                    return Hero(
                      tag: wallPaper[index].imgScr,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenView(
                                imgSrc: wallPaper[index].imgScr,
                              ),
                            ),
                          );
                        },
                        child: WallPaperWidget(
                          imgScr: wallPaper[index].imgScr,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
