class Urls {
  static const String _baseUrl = 'https://ecom-api.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String getHomeSliders = '$_baseUrl/ListProductSlider';

  static String getCategories = '$_baseUrl/CategoryList';

  static String getProductsByRemarks(String remarks) =>
      '$_baseUrl/ListProductByRemark/$remarks';

  static String getProductDetails(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';

  static const String addToCart = '$_baseUrl/CreateCartList';

  static String getProductByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static const String getCartList = '$_baseUrl/CartList';

  static const String createProfile = '$_baseUrl/CreateProfile';

  static const String readProfile = '$_baseUrl/ReadProfile';

  static String removeFromCart(int id) => '$_baseUrl/DeleteCartList/$id';

  static String createWishList(int id) => '$_baseUrl/CreateWishList/$id';

  static const String showWishList = '$_baseUrl/ProductWishList';

  static String deleteWishList(int id) => '$_baseUrl/RemoveWishList/$id';

  static const String createInvoice = '$_baseUrl/InvoiceCreate';

  static const String createReview = '$_baseUrl/CreateProductReview';

  static String reviewList(int id) => '$_baseUrl/ListReviewByProduct/$id';
}
