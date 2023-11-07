class Promotion {
  final int id;
  final String title;
  final String subContent;
  final String startDate;
  final String endDate;
  final bool isOpen;
  final String? productPicUrl;
  final String? smallThumbnail;
  final String? bigThumbnail;

  Promotion(this.id, this.title, this.subContent, this.startDate, this.endDate,
      this.isOpen, this.productPicUrl, this.smallThumbnail, this.bigThumbnail);

  Promotion.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        subContent = json["subContent"],
        startDate = json["startDate"],
        endDate = json["endDate"],
        isOpen = json["isOpen"],
        productPicUrl = json["productPicUrl"],
        smallThumbnail = json["smallThumbnail"],
        bigThumbnail = json["bigThumbnail"];
}
