import 'package:flutter/material.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
          decoration: ShapeDecoration(
            color:const Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )
          ),
            
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height*.2+30,
            left: 36,
            right: 36,
            child: Row(children:
            List.generate(40, (index) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
                  color: Colors.grey,

                  height: 3,
                ),
              ),
            ))

              ,),
          ),
          Positioned(
          bottom: MediaQuery.sizeOf(context).height*.2,
          left: -30,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
          )),
          Positioned(
              bottom: MediaQuery.sizeOf(context).height*.2,
              right: -30,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
              )),
          const Positioned(
            left: 0,
            right: 0,
            top: -60,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: const Color(0xFFD9D9D9),child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: Icon(Icons.check,size: 60,),
            ),),
          ),


        ],
      ),
    );
  }
}
