import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Listening extends StatelessWidget {
  const Listening({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(onPressed: (){},child: Icon(Icons.mic_none_sharp),),
      body: SafeArea(
        child: Stack(
          children: [
             Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff0d4690), Color(0xff7e8eaf)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            Container(child: "x".text.white.minFontSize(42).make(),).p(20)
          ],
        ),
      ),
    );
  }
}