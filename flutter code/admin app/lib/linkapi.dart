class AppLinkApi{
 /* static const String server='http://10.0.2.2/Ecommerce';
  static const String staticImage='http://10.0.2.2/Ecommerce/upload';
 static const String staticImageCategories='http://10.0.2.2/Ecommerce/upload/categories';
  static const String staticImageItems='http://10.0.2.2/Ecommerce/upload/items';*/

  static const String server='http://192.168.1.4/Ecommerce';
  static const String staticImage='http://192.168.1.4/Ecommerce/upload';
  static const String staticImageCategories='http://192.168.1.4/Ecommerce/upload/categories';
  static const String staticImageItems='http://192.168.1.4/Ecommerce/upload/items';

  static const String test='$server/test.php';
  //======================Auth===================//
  
  static const String signUp='$server/admin/Auth/signUp.php';
  static const String logIn='$server/admin/Auth/login.php';
  static const String verifyCode='$server/admin/Auth/verfiycode.php';
  static const String reSendCode='$server/admin/Auth/reSendCode.php';

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
  static const String checkout="$server/delivery/orders/checkout.php";
  static const String pendingOrders="$server/delivery/orders/pending.php";
  static const String archiveOrders ="$server/delivery/orders/archive.php";
 static const String ordersDetails ="$server/delivery/orders/details.php";

  static const String ordersAccepted ="$server/delivery/orders/accepted.php";
  static const String ordersAprove ="$server/delivery/orders/approve.php";
  static const String done ="$server/delivery/orders/done.php";





//////////////////////////////notification////////////////////////////
  static const String notification='$server/notification.php';
  //////////////////////offers////////////////////////

  static const String offers='$server/offers.php';
    static const String rating='$server/rating.php';
  static const String categoriesAdminView='$server/admin/categories/view.php';
  static const String categoriesAdminAdd='$server/admin/categories/add.php';
  static const String categoriesAdminEdit='$server/admin/categories/edit.php';
  static const String categoriesAdminDelete='$server/admin/categories/delete.php';
  static const String itemsAdminView='$server/admin/items/view.php';
  static const String itemsAdminAdd='$server/admin/items/add.php';
  static const String itemsAdminEdit='$server/admin/items/edit.php';
  static const String itemsAdminDelete='$server/admin/items/delete.php';
  static const String usersAdminView='$server/admin/users/view.php';
  static const String ordersAproveAdmin ="$server/admin/orders/approve.php";
  static const String ordersprepareAdmin ="$server/admin/orders/prepare.php";

  static const String archiveAdmin ="$server/admin/orders/archive.php";
  static const String viewPendingordersAdmin ="$server/admin/orders/viewpending.php";
  static const String viewAcceptedordersAdmin ="$server/admin/orders/viewaccpted.php";
  static const String ordersAdminDetails ="$server/admin/orders/details.php";
  static const String settingAdmin ="$server/admin/users/setting.php";









}