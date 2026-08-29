import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/classes/handlingDataView.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/veiw/widget/checkout/customcardPaymentmethode.dart';

import '../../conttrolar/checkoutController.dart';
import '../../core/consstans/imageassets.dart';
import '../../paymob/widget/PaymentDetailViewBody.dart';
import '../widget/checkout/addressCard.dart';
import '../widget/checkout/carddeliverytype.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Out"),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: MaterialButton(
          color: Colorapp.secondColor,
          textColor: Colors.white,
          onPressed: () {
            controller.checkout();
          },
          child: const Text(
            "Check Out",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  const Text(
                    "Choose Payment Method",
                    style: TextStyle(
                        color: Colorapp.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                      onTap: () {
                        controller.choosePaymentMethod('0');
                      },
                      child: CardPaymentMethodCheckout(
                        title: "Cash",
                        isActive:
                            controller.paymentMethod == '0' ? true : false,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                      onTap: () {
                        controller.choosePaymentMethod('1');
                      },
                      child: CardPaymentMethodCheckout(
                        title: "Payment Cards",
                        isActive:
                            controller.paymentMethod == '1' ? true : false,
                      )),
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    "Choose Delivery Type",
                    style: TextStyle(
                        color: Colorapp.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            controller.chooseDeliveryType('0');
                          },
                          child: CardDeliveryTypeCheckout(
                            title: "Delivery",
                            isActive:
                                controller.deliveryType == '0' ? true : false,
                            image: ImageAssets.delivery,
                          )),
                      SizedBox(
                        width: 16,
                      ),
                      InkWell(
                          onTap: () {
                            controller.chooseDeliveryType('1');
                          },
                          child: CardDeliveryTypeCheckout(
                            isActive:
                                controller.deliveryType == '1' ? true : false,
                            title: "Drive Thru",
                            image: ImageAssets.drivethru,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  if (controller.deliveryType == '0')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shipping Address",
                          style: TextStyle(
                              color: Colorapp.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        if (controller.dataaddress.isEmpty)
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.addressAdd);
                            },
                            child: Container(
                              child: Center(
                                  child: Text(
                                "Please Add your address \n Click Here to add",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colorapp.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                            controller.dataaddress.length,
                            (index) => InkWell(
                                  onTap: () {
                                    controller.chooseShippingAddress(controller
                                        .dataaddress[index].addressId
                                        .toString());
                                  },
                                  child: CardAddressCheckout(
                                    isActive: controller.addressId ==
                                            controller
                                                .dataaddress[index].addressId
                                                .toString()
                                        ? true
                                        : false,
                                    title:
                                        "${controller.dataaddress[index].addressName}",
                                    body:
                                        '${controller.dataaddress[index].addressCity} Street ${controller.dataaddress[index].addressStreet}  ',
                                  ),
                                ))
                      ],
                    )
                ],
              ),
            )),
      ),
    );
  }
}
