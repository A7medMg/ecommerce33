import 'package:dio/dio.dart';
import 'package:shoppapp/linkapi.dart';

class PaymobManger{
Dio dio=Dio();
Future<String> payWithPaymob(int amount)async{
  try{
   String token =await getToken();
   int orderId=await getOrderId(token: token, amount:(100* amount).toString());
   String payMentKey= await getPaymentKey(token: token, orderId: orderId.toString(), amount: (100* amount).toString());


return payMentKey;

  }catch(e){
    rethrow;
  }
}

Future<String> getToken()async{
try{
  Response response=await dio.post('https://accept.paymob.com/api/auth/tokens',
      data: {"api_key":AppLinkApi.BAYMENTAPIkEY}
  );
  return response.data['token'];

}catch(e){
  rethrow;
}
}
Future<int>getOrderId({required String token ,required String amount})async{
  try{
    Response response=await dio.post('https://accept.paymob.com/api/ecommerce/orders',
        data: {"auth_token":token,
          "delivery_needed": "true",
          "amount_cents": amount,
          "currency": "EGP",
          "items":[]

        }
    );
    return response.data['id'];

  }catch(e){
    rethrow;
  }

}
Future<String> getPaymentKey({required String token ,required String orderId,required String amount})async{
try{
  Response response=await dio.post('https://accept.paymob.com/api/acceptance/payment_keys',
  data: {
    "auth_token": token,

    "amount_cents": amount,
    "order_id": orderId,
    "billing_data": {

    },
    "currency": "EGP",
    "integration_id": 1,
    "lock_order_when_paid": "false"

  });
  return response.data['token'];
}catch(e){
  rethrow;
}
}

}