class Category {
  final int id;
  final String categoryName;
  final String categoryEngName;
  final int code;  // 0 : 음료 , 1 : 푸드
  final String categoryPicUrl;

  Category(this.id, this.categoryName, this.categoryEngName, this.code,
      this.categoryPicUrl);
}
