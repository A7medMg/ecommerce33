class AppLinkApi{
 /*static const String server='http://10.0.2.2/Ecommerce';
  static const String staticImage='http://10.0.2.2/Ecommerce/upload';
 static const String staticImageCategories='http://10.0.2.2/Ecommerce/upload/categories';
  static const String staticImageItems='http://10.0.2.2/Ecommerce/upload/items';*/

  static const String server='http://192.168.1.4/Ecommerce';
  static const String staticImage='http://192.168.1.4/Ecommerce/upload';
  static const String staticImageCategories='http://192.168.1.4/Ecommerce/upload/categories';
  static const String staticImageItems='http://192.168.1.4/Ecommerce/upload/items';

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
//========================Coupon ===============//
  static const String checkcoupon="$server/coupon/checkcoupon.php";
//========================orders ===============//
  static const String checkout="$server/orders/checkout.php";
  static const String pendingOrders="$server/orders/pending.php";
  static const String archiveOrders ="$server/orders/archive.php";
 static const String ordersDetails ="$server/orders/details.php";
 static const String deleteOrders ="$server/orders/delete.php";


//////////////////////////////notification////////////////////////////
  static const String notification='$server/notification.php';
  //////////////////////offers////////////////////////

  static const String offers='$server/offers.php';
    static const String rating='$server/rating.php';

  static const String BAYMENTAPIkEY='ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RjM016UTJMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuejRQNEE2WjdDekItWVRnNXlJYzJuNkk2MVNERU1Yd0xDdkJJZHpFR1lwSGM1aFNxSE05cXRyNXdYakxpRWtTYlJ5dFZHRUZ0UWZEYUFTOGZZYzV1VXc=';









}