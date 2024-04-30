import 'package:get/get.dart';
import 'package:shoppapp/data/datasource/remote/Auth/signup.dart';

import '../conttrolar/Auth/SignUpController.dart';
import '../core/classes/crud.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
   Get.put(Crud());
   //Get.put(SignupData(crud));
  }

}