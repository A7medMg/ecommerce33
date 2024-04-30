import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud{
  Future<Either<StatusRequest,Map>>postData(String linkurl,Map data)async{
   try{
     if(await checkInternet()){
       var response=await http.post(Uri.parse(linkurl),body: data);
       if(response.statusCode==200|| response.statusCode==201){
         Map responsebody=jsonDecode(response.body);
         print(responsebody);
         return Right(responsebody) ;

       }else{
         return const  Left(StatusRequest.serverFailure);
       }
     }else{
       return const Left(StatusRequest.offlineFailure);
     }


   }catch(_){

   return const Left(StatusRequest.serverException);
   }
  }
}