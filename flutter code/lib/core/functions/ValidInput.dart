import 'package:get/get.dart';

ValidInput(String val,int min, int max,String type){
  if(type =='username'){
    if(!GetUtils.isUsername(val)){
      return 'Not valid username';
    }
  }
  if (type =='email'){
    if(!GetUtils.isEmail(val)){
      return 'Not Valid email';
    }
  }
  if (type =='phone'){
    if(!GetUtils.isPhoneNumber(val)){
      return 'Not Valid phone';
    }
  }
  if(val.length <min){
    return 'length can`t be less than $min ';
  }
  if(val.length >max){
    return 'can`t be larger than $max ';
  }
  if(val.isEmpty){
    return 'can`t be empty ';
  }

}