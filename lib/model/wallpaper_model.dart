class WallPaperModel {
  String imgScr;
  String photographerName;
  WallPaperModel({required this.imgScr, required this.photographerName});

  static WallPaperModel fromJson(Map<String, dynamic> wallpaper) {
    return WallPaperModel(
      imgScr: wallpaper["src"]["portrait"],
      photographerName: wallpaper["photographer"],
    );
  }
}
