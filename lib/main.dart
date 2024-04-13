// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gen_ai_travel/groqreq.dart';
import 'package:gen_ai_travel/listen.dart';
import 'package:gen_ai_travel/schedule.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.withOpacity(0.4)),
        useMaterial3: true,
      ),
      home:  HomeT(),
    );
  }
}



class HomeT extends StatefulWidget {
  const HomeT({super.key});

  @override
  State<HomeT> createState() => _HomeTState();
}

class _HomeTState extends State<HomeT> {



  Future getWeatherData() async {
    var response = await http
        .get(Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': "NOIDA"+ "",
      'appid': 'edfa51a4ff3946732f60307189d4da34',
      'units': 'metric'
    }));
    
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(Listening());
        },
        backgroundColor: Colors.blue[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //                  landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      //                  backgroundColor: Color.fromRGBO(21, 27, 35, 1),
      //                  elevation: 0,
      //                  items: [
      //     BottomNavigationBarItem(
      //          icon: Icon(Icons.home),label: "home",tooltip: "hey"),
      //     BottomNavigationBarItem(
      //          icon: Icon(Icons.pin_drop_outlined),label: "pin"),
      //     BottomNavigationBarItem(
      //          icon: Icon(Icons.mic_none_outlined), label: "mic"),
      //     BottomNavigationBarItem(
      //          icon: Icon(Icons.person_4_sharp), label: "profile"),
      //   ],),
      body: Stack(
        
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
              //-------------top name------------------------------------------
              "Hi ".text.white.minFontSize(24).make().p(15),
              "Plan the Best Trip Together".text.white.minFontSize(40).make().pLTRB(10, 50, 0, 0),
              "Vacation".text.color(Colors.white.withOpacity(0.2)).fontWeight(FontWeight.bold).minFontSize(42).make()
              .pLTRB(10, 150, 0, 0),
              // ------------------------------ TOP NAVbar---------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    gradient: LinearGradient(colors: [const Color.fromARGB(255, 169, 158, 188).withOpacity(0.3),Colors.white.withOpacity(0.3)])
                        ),
                        child: Icon(Icons.search,color: Colors.white,),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 169, 158, 188).withOpacity(0.3),
                      Colors.white.withOpacity(0.3)
                    ])),
                child: "🏖️ beach".text.white.make().centered(),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 169, 158, 188).withOpacity(0.3),
                      Colors.white.withOpacity(0.3)
                    ])),
                child: " ⛳  Auxiliary".text.white.make().centered(),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 169, 158, 188).withOpacity(0.3),
                      Colors.white.withOpacity(0.3)
                    ])),
                child: "🏠 Home".text.white.make().centered(),
              ),

              ],
          ).centered().p(5),
          Center(
            child: Container(
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.40,
                    width: MediaQuery.of(context).size.width*0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                       gradient: LinearGradient(
                            colors: [
                               Color.fromARGB(255, 137, 125, 169).withOpacity(0.5),
                               Colors.white.withOpacity(0.5)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ["Places".text.color(Colors.white.withOpacity(0.4)).minFontSize(18).fontWeight(FontWeight.w600).make().pLTRB(0, 5, 100, 0),
                      "Dubai".text
                            .white
                            .minFontSize(32)
                            .fontWeight(FontWeight.w600)
                            .make()],
                    ),
                  ).pLTRB(010, MediaQuery.of(context).size.height * 0.50, 0, 0),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.49,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.withOpacity(0.3),
                           gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 115, 180, 173).withOpacity(0.8),
                                  Color.fromARGB(255, 175, 162, 122).withOpacity(0.8)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)
                          
                        ),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "8 Hr 43 min "
                                .text
                                .color(Colors.white.withOpacity(0.4))
                                .minFontSize(15)
                                .fontWeight(FontWeight.w600)
                                .make()
                                .pLTRB(5, 5, 100, 0),
                            "Dubai --✈️--India"
                                .text
                                .color(Colors.white.withOpacity(0.6))
                                .minFontSize(22)
                                .fontWeight(FontWeight.w600)
                                .make()
                          ],
                        ),
                      
                      ).p(2),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.49,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.withOpacity(0.3),
                          gradient: LinearGradient
                          (colors: [Colors.blue.withOpacity(0.8),Colors.white.withOpacity(0.8)],
                          begin: Alignment.topCenter,end: Alignment.bottomCenter)
                        ),
                       
                      ).p(2)
                    ],
                  ).pLTRB(5, MediaQuery.of(context).size.height*0.53, 5, 0)
                ],
              ),
            ),
          )
        ],
      ),
    )
    );
  }
}