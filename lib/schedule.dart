// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:gen_ai_travel/booking.dart';

class Scheduler extends StatefulWidget {
  String text;
   Scheduler({
    super.key,
    required this.text,
  });

  @override
  State<Scheduler> createState() => _SchedulerState();
}

class _SchedulerState extends State<Scheduler> {

  var time=0;

  DateTime rangeStart=DateTime.now();
  DateTime rangeEnd = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      floatingActionButton: FloatingActionButton.small(elevation: 0,onPressed: (){},shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10000)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          // backgroundBlendMode: BlendMode.color,
          gradient: LinearGradient(colors: [Color.fromARGB(255, 79, 144, 219),Colors.white,
                
               
              ],begin: AlignmentDirectional.topCenter,end: AlignmentDirectional.bottomCenter)
        ),
      ),),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*1,
            width: MediaQuery.of(context).size.height*1,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xff0d4690),Color(0xff7e8eaf)],begin: Alignment.topCenter,end: Alignment.bottomCenter)
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                "Can You Show me Vacation Options for a trip to sea ?".text.white.minFontSize(36).make(),
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
                            color:  Color.fromARGB(255, 158, 197, 229)
                                .withOpacity(0.3),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.3))),
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
                            Colors.transparent,
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
                        color: Colors.transparent,
                        border:
                            Border.all(color: Colors.white.withOpacity(0.3))),
                    child: "Where"
                        .text
                        .color(Colors.white.withOpacity(0.5))
                        .makeCentered(),
                  ).p(10),
             
            
                ],),
            
            // ---------------------------------------------------------------------------------
                 "Step 1 :  Choose the dates for the trip :".text.minFontSize(24).color(Colors.white.withOpacity(0.4)).make().p(10),
            

            Row(
              children: [
                 Column(
                   children: [
                   "Start"
                          .text
                          .minFontSize(20)
                          .color(Colors.white.withOpacity(0.5))
                          .makeCentered()
                          .p(5),
                      rangeStart.day.text.white.make(),
                   ],
                 ).pLTRB(0, 0, 40, 0),
                  Column(
                    children: [
                      "Departure"
                          .text.minFontSize(20)
                          .color(Colors.white.withOpacity(0.5))
                          .makeCentered().p(5),
                          rangeEnd.day.text.white.make(),
                    ],
                  ),
              ],
            ).pLTRB(100,0, 0, 0)
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
            
               ,ClipRRect(
                 child: Container(
                             clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: Color(0xff909ebc),
                      // gradient: LinearGradient(colors: [const Color.fromARGB(255, 125, 166, 237).withOpacity(0.2),const Color.fromARGB(255, 82, 129, 169).withOpacity(0.2)]),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: BackdropFilter(
                      filter:ImageFilter.blur(sigmaX: 50,sigmaY: 50), 
                      child: TableCalendar(
                        
                        // headerVisible: false,
                        
                        calendarFormat: CalendarFormat.month,
                        rangeSelectionMode: RangeSelectionMode.enforced,

                        //
                        rangeStartDay: rangeStart,
                        rangeEndDay: rangeEnd,
                       //
                      //  onDayLongPressed: ,
                      onDaySelected: (selectedDay, focusedDay){
                        rangeStart=selectedDay;
                        setState((){
                          
                        });
                      },
                      onDayLongPressed: (selectedDay, focusedDay){
                        rangeEnd=selectedDay;
                        setState((){
                          
                        });
                      },
                      
                        headerStyle: HeaderStyle(titleCentered: true,
                        titleTextStyle: TextStyle(color: Colors.white,fontSize: 24)),
                        daysOfWeekStyle: DaysOfWeekStyle(
                        
                          weekdayStyle: TextStyle(color: Colors.white),
                          weekendStyle: TextStyle(color: Colors.white)
                          
                        ),
                        
                        calendarStyle: CalendarStyle(
                          
                          rangeHighlightColor: Colors.white.withOpacity(0.2),
                          withinRangeTextStyle: TextStyle(color: Colors.white),
                          rangeStartDecoration: BoxDecoration(
                            // border: Border.all(),
                              color: Colors.blueGrey.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(100)),
                          rangeEndDecoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(100)), 
                          // tableBorder: TableBorder(borderRadius: BorderRadius.circular(20),)                         
                        ),
                        
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2050, 3, 14),
                        focusedDay: DateTime.now(),
                      ),
                    ),
                  ).p(10),
               ).pLTRB(0, MediaQuery.of(context).size.height*0.075, 0, 0),
               ElevatedButton(onPressed: (){
                Get.to(Book(text: widget.text));
               }, child: "Next".text.make()),
              ],
            ),
          ),
        ]
      ),
    ));
  }
}