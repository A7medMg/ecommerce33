import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shoppapp/core/functions/checkinternet.dart';

class Textx extends StatefulWidget {
  const Textx({super.key});

  @override
  State<Textx> createState() => _TextxState();
}

class _TextxState extends State<Textx> {
  var res;
  intialdata()async{
    res=await checkInternet();
    print(res);
  }
  @override
  void initState() {
    intialdata();

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: ListView(
        padding: EdgeInsets.all(50),
        children: [
          OtpTextField(
            fieldWidth: 50,
            borderRadius: BorderRadius.circular(15),
            numberOfFields: 5,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {

            }, // end onSubmit
          ),
        ],
      ),
    );
  }
}
