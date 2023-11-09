class Product {
  final int id;
  final String productName;
  final String productEngName;
  final String productDescription;
  final String productTip;
  final int hotIce; // 0 : hot ,1 : iceonly , 2: hot iced, 3 : null
  final String productPicUrl;
  final int category;


  Product(
      this.id,
      this.productName,
      this.productEngName,
      this.productDescription,
      this.productTip,
      this.hotIce,
      this.productPicUrl,
      this.category,);
}
