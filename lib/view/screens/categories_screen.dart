import 'package:flutter/material.dart';
import 'package:testflutter/controllers/api_operation.dart';
import 'package:testflutter/model/wallpaper_model.dart';
import 'package:testflutter/view/screens/full_screen_view.dart';

class CategoryScreen extends StatefulWidget {
  String catName;
  String catImgUrl;

  CategoryScreen({super.key, required this.catImgUrl, required this.catName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<WallPaperModel> categoryResults;
  bool isLoading  = true;
  GetCatRelWall() async {
    categoryResults = await ApiOperation().getSearchWallpaper(widget.catName);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetCatRelWall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: isLoading  ? Center(child: CircularProgressIndicator(),)  : SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: const Text(
                "Wall Paper",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Stack(
              children: [
                Image.network(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    widget.catImgUrl),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black38,
                ),
                Positioned(
                  left: 120,
                  top: 40,
                  child: Column(
                    children: [
                      Text("Category",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w300)),
                      Text(
                        widget.catName,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 700,
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 400,
                      crossAxisCount: 2,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 10),
                  itemCount: categoryResults.length,
                  itemBuilder: ((context, index) => GridTile(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FullScreenView(
                                    imgSrc:
                                    categoryResults[index].imgScr)));
                      },
                      child: Hero(
                        tag: categoryResults[index].imgScr,
                        child: Container(
                          height: 800,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                                height: 800,
                                width: 50,
                                fit: BoxFit.cover,
                                categoryResults[index].imgScr,),
                          ),
                        ),
                      ),
                    ),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
