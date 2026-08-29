import 'package:get/get.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/core/services/services.dart';
import 'package:shoppapp/data/datasource/remote/addressdata.dart';
import 'package:shoppapp/data/datasource/remote/checkoutData.dart';
import 'package:shoppapp/data/model/addressModel.dart';

import '../core/functions/handlingDataController.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  MyServices myServices = Get.find();
  List<AddressModel> dataaddress = [];
  String? paymentMethod;
  String? deliveryType;
  String addressId = "0";
  late String couponid;
  late String coupondiscount;
  late String priceorders;

  StatusRequest statusRequest = StatusRequest.none;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressId = val;
    update();
  }

  checkout() async {
    if (paymentMethod == null)
      return Get.snackbar("Error", "please choose a payment method");
    if (deliveryType == null)
      return Get.snackbar("Error", "please choose a delivery type");
    if (dataaddress.isEmpty)
      return Get.snackbar("Error", "please go to add your address");

    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString('id'),
      "addressid": addressId.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "100",
      "ordersprice": priceorders.toString(),
      "couponid": couponid.toString(),
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
    };

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        //Get.offAllNamed(AppRoute.Home_Page);
        if(paymentMethod == '1'){
          Get.offAllNamed(AppRoute.PaymentDetails);
          Get.snackbar("Success", "The order was successfully ");
        }else{
          Get.offAllNamed(AppRoute.Home_Page);
          Get.snackbar("Success", "The order was successfully ");
        }



      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
      // End
    }
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressId=dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.success;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    priceorders = Get.arguments['pticeorder'];
    couponid = Get.arguments['couponid'].toString();
    coupondiscount = Get.arguments['coupondiscount'].toString();
    getShippingAddress();
    // TODO: implement onInit
    super.onInit();
  }
}
