import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gen_ai_travel/controllers.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  final Schedule update = Get.put(Schedule());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton.small(
        elevation: 0,
        onPressed: () {},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10000)),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              // backgroundBlendMode: BlendMode.color,
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 79, 144, 219),
                    Colors.white,
                  ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter)),
        ),
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff0d4690), Color(0xff7e8eaf)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              "Can You Show me Vacation Options for a trip to sea ?"
                  .text
                  .white
                  .minFontSize(36)
                  .make(),
              Row(
                children: [
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.24,
                        height: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white.withOpacity(0.3))),
                        child: "22-23 Oct"
                            .text
                            .color(Colors.white.withOpacity(0.8))
                            .makeCentered(),
                      ).p(10),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Color.fromARGB(255, 158, 197, 229).withOpacity(0.3),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.3))),
                    child: "WHO"
                        .text
                        .color(Colors.white.withOpacity(0.5))
                        .makeCentered(),
                  ).p(10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    height: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent
                          ,
                        border:
                            Border.all(color: Colors.white.withOpacity(0.3))),
                    child: "Where"
                        .text
                        .color(Colors.white.withOpacity(0.5))
                        .makeCentered(),
                  ).p(10),
                ],
              ),

              // ---------------------------------------------------------------------------------
              "Step 2 :  Choose with whom you will go :"
                  .text
                  .minFontSize(24)
                  .color(Colors.white.withOpacity(0.4))
                  .make()
                  .p(10),

              Container(
                height: MediaQuery.of(context).size.height*0.12,
                width: MediaQuery.of(context).size.width*0.5,
                color: Colors.transparent,
                child: GridView.builder(itemCount: 6,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemBuilder: (BuildContext,x){
                  return Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000)
                    ),child: Image.asset("lib/assets/image.jpg",scale: 0.1,fit: BoxFit.cover,)).pLTRB(0,0,10,10);
                })
              ),
              // TextField(
              //                   cursorColor: Colors.white,
              //                   decoration: InputDecoration(
              //   filled: true,
              //   fillColor: Color.fromRGBO(166, 194, 229, 0.8),
              //   labelStyle:
              //       TextStyle(color: Colors.white, fontSize: 20),
              //   labelText: "Start",
              //   enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide(
              //           color: Colors.white.withOpacity(0.3))),
              //   focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide(
              //           color: Colors.white.withOpacity(0.3)))),
              //                 ).p(10),

              "Add contact".text.color(Colors.white.withOpacity(0.5)).make(),
              IconButton(onPressed: (){}, icon: Icon(Icons.add),color: Colors.white,),
              Obx(
                ()=> ClipRRect(
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        color: Color(0xff909ebc),
                        // gradient: LinearGradient(colors: [const Color.fromARGB(255, 125, 166, 237).withOpacity(0.2),const Color.fromARGB(255, 82, 129, 169).withOpacity(0.2)]),
                        borderRadius: BorderRadius.circular(20)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                      child: Column(
                        children: [
                         ListTile(
                              leading: Container(
                                height: MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 134, 148, 177)
                                        .withOpacity(0.4)),
                                child: Icon(
                                  Icons.bed_sharp,
                                  color: Colors.white,
                                ),
                              ),
                              title: "Rooms".text.white.make(),
                              trailing: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          update.removeRoom();
                                        },
                                        icon: Icon(
                                          CupertinoIcons.minus,
                                          size: 15,
                                          color: Colors.white,
                                        )),
                                    update.Rooms.value.text.minFontSize(18).white.make(),
                                    IconButton(
                                        onPressed: () {
                                          update.addRoom();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 15,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ).pLTRB(20, 0, 0, 0)),
                          ListTile(
                              leading: Container(
                                height: MediaQuery.of(context).size.height*0.05,
                                width: MediaQuery.of(context).size.height * 0.05 ,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 134, 148, 177)
                                        .withOpacity(0.4)),
                                child: Icon(
                                  Icons.person_add_alt,
                                  color: Colors.white,
                                ),
                              ),
                              title: "Adults".text.white.make(),
                               subtitle: "Age 13 or above"
                                  .text
                                  .color(Colors.white.withOpacity(0.5))
                                  .make(),
                              trailing: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          update.removeAdults();
                                        },
                                        icon: Icon(
                                          CupertinoIcons.minus,
                                          size: 15,
                                          color: Colors.white,
                                        )),
                                    update.Adults.value.text.minFontSize(18).white.make(),
                                    IconButton(
                                        onPressed: () {
                                          update.addAdults();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 15,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ).pLTRB(20, 0, 0, 0)),
                              ListTile(
                              leading: Container(
                                height: MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 134, 148, 177).withOpacity(0.4)),
                                child: Icon(
                                  Icons.child_care,
                                  color: Colors.white,
                                ),
                              ),
                              title: "Children".text.white.make(),
                               subtitle: "Age 2-13"
                                  .text
                                  .color(Colors.white.withOpacity(0.5))
                                  .make(),
                              trailing: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          update.removechildren();
                                        },
                                        icon: Icon(
                                          CupertinoIcons.minus,
                                          size: 15,
                                          color: Colors.white,
                                        )),
                                    update.children.value.text.minFontSize(18).white.make(),
                                    IconButton(
                                        onPressed: () {
                                          update.addchildren();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 15,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ).pLTRB(20, 0, 0, 0)),
                              ListTile(
                              leading: Container(
                                height: MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 134, 148, 177)
                                        .withOpacity(0.4)),
                                child: Icon(
                                  Icons.baby_changing_station,
                                  color: Colors.white,
                                ),
                              ),
                              title: "Infants".text.white.make(),
                              subtitle: "Under 2".text.color(Colors.white.withOpacity(0.5)).make(),
                              trailing: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          update.removeInfants();
                                        },
                                        icon: Icon(
                                          CupertinoIcons.minus,
                                          size: 15,
                                          color: Colors.white,
                                        )),
                                    update.Infants.value.text.minFontSize(18).white.make(),
                                    IconButton(
                                        onPressed: () {
                                          update.addInfants();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 15,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ).pLTRB(20, 0, 0, 0)),
                          
                          
                        ],
                      ),
                    ),
                  ).p(10),
                ).pLTRB(0, 10, 0, 0),
              ),
              ElevatedButton(onPressed: () {}, child: "Next".text.make()),
            ],
          ),
        ),
      ]),
    ));
  }
}
