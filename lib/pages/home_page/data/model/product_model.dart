class ProductModel {
  final String productName;
  final String productId;
  final String productImage;
  final bool isFavorite;

  const ProductModel({
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.isFavorite,
  });
}
