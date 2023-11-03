class Beverage {
  final int id;
  final String beverageName;
  final String beverageEngName;
  final String beverageDescription;
  final String beverageTip;
  final int hotIce;  // 0 : hot ,1 : iceonly , 2: hot iced
  final String beveragePicUrl;
  final int category;
  final int price;

  Beverage(
      this.id,
      this.beverageName,
      this.beverageEngName,
      this.beverageDescription,
      this.beverageTip,
      this.hotIce,
      this.beveragePicUrl,
      this.category,
      this.price
      );
}
