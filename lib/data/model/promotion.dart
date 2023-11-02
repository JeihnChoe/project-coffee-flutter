class Promotion {
  final int id;
  final String title;
  final String subContent;
  final String startDate;
  final String endDate;
  final bool isOpen;
  final String? productPicUrl;
  final String? thumbnail;
  final String? homeThumbnail;

  Promotion(this.id, this.title, this.subContent, this.startDate, this.endDate,
      this.isOpen, this.productPicUrl, this.thumbnail, this.homeThumbnail);

  Promotion.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        subContent = json["subContent"],
        startDate = json["startDate"],
        endDate = json["endDate"],
        isOpen = json["isOpen"],
        productPicUrl = json["productPicUrl"],
        thumbnail = json["thumbnail"],
        homeThumbnail = json["homeThumbnail"];
}
