class BannerEntity {
  String? imagePath;
  String? title;
  String? desc;

  BannerEntity({this.imagePath, this.title, this.desc});

  BannerEntity.fromJson(Map<String, dynamic> json) {
    imagePath = json['IMAGEPATH'];
    title = json['TITLE'];
    desc = json['DESC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IMAGEPATH'] = this.imagePath;
    data['TITLE'] = this.title;
    data['DESC'] = this.desc;
    return data;
  }
}

class BannerEntitys {
  final List<BannerEntity> list;

  BannerEntitys({required this.list});

  factory BannerEntitys.fromJson(List<dynamic> json) {
    return BannerEntitys(
        list: json.map((e) => BannerEntity.fromJson(e)).toList());
  }
}
