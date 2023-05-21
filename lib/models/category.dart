class Category {
  final String id;
  final String title;
  final String imageUrl;

  const Category({
    //تم استخدام @required لحماية المتغيرات من عدم الإدخال
    required this.id,
    required this.title,
    required this.imageUrl,
  });
}
