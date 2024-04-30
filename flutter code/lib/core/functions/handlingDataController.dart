import 'package:shoppapp/core/classes/statusrequest.dart';

handlingData(response){
  if(response is StatusRequest){
    return response;
  }else{
    return StatusRequest.success;
  }
}