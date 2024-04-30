class AppLinkApi{
  static const String server='http://10.0.2.2/Ecommerce';
  static const String staticImage='http://10.0.2.2/Ecommerce/upload';
  static const String staticImageCategories='http://10.0.2.2/Ecommerce/upload/categories';
  static const String staticImageItems='http://10.0.2.2/Ecommerce/upload/items';

  static const String test='$server/test.php';
  //======================Auth===================
  static const String signUp='$server/Auth/signUp.php';
  static const String logIn='$server/Auth/login.php';
  static const String verifyCode='$server/Auth/vrifycode.php';
  static const String reSendCode='$server/Auth/reSendCode.php';

  //====================forgetpassword=========//
  static const String checkEmail="$server/forgetpassword/checkemail.php";
  static const String resetPassword="$server/forgetpassword/resetpassword.php";
  static const String verifyCodeForget="$server/forgetpassword/verifycode.php";
  //=====================Home======================//
  static const String homePage="$server/home.php";
  //========================items ===============//
  static const String items="$server/items/items.php";
  static const String search="$server/items/search.php";

  //========================FAVORITE ===============//
  static const String favoriteAdd="$server/favorite/add.php";
  static const String favoriteRemove="$server/favorite/remove.php";
  static const String favoriteView="$server/favorite/veiw.php";
  static const String deletfromfavorite="$server/favorite/deletefromfavorite.php";
//========================cart ===============//
  static const String cartAdd="$server/cart/add.php";
  static const String cartDelete="$server/cart/delete.php";
  static const String cartView="$server/cart/view.php";
  static const String cartItemsCount="$server/cart/getcountitems.php";
  //========================Address ===============//
  static const String addAddress="$server/address/add.php";
  static const String deleteAddress="$server/address/delete.php";
  static const String viewAddress="$server/address/view.php";








}