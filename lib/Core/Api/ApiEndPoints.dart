class ApiEndPoints {
  //https://ecommerce.routemisr.com/api/v1/auth/signup

  static const String baseUrl = 'ecommerce.routemisr.com';
  static const String registerEndPoint = '/api/v1/auth/signup';
  static const String loginEndPoint = '/api/v1/auth/signin';
  static const String allCategoriesEndPoint = 'api/v1/categories';
  static const String allBrandsEndPoint = '/api/v1/brands';
  static const String allProductsEndPoint = '/api/v1/products';
  static const String addToCartEndPoint = '/api/v1/cart';
  static const String getAndAddToWishListEndPoint = '/api/v1/wishlist';
  static const String removeWishListEndPoint = '/api/v1/wishlist/';

  static String removeFromCartEndPoint({required String id}) =>
      '/api/v1/cart/$id';

  static String subCategoriesEndPoint({required String id}) =>
      '/api/v1/categories/$id/subcategories';
}
