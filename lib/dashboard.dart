import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "lib/assets/sky1.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
    Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          leading: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white12, width: 3.0),
              borderRadius: BorderRadius.circular(10)

            ),
              child: Icon(Icons.navigate_before, color: Colors.white,).p(2)
          ),
        ),

          title: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Container(
                  alignment: Alignment.topRight,
                  child: Container(decoration: BoxDecoration(
    border: Border.all(color: Colors.white12, width: 3.0),
    borderRadius: BorderRadius.circular(10)

    ),child: Icon(Icons.notifications_none_outlined, color: Colors.white,).p(2))
            )],
          ),
        ),
    ),
    body: Center(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Column(
      
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
      
            Container(
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.height * .15,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('lib/assets/ProfilePic.jpeg'),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(30)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Explorer",
                  style: TextStyle(
                      color: Colors.amber),),
                SizedBox.fromSize(size: Size.square(10)),
                Text("-",
                  style: TextStyle(
                      color: Colors.white),),
                SizedBox.fromSize(size: Size.square(10)),
      
                Text("May 2021",
                  style: TextStyle(
                      color: Colors.white),),
              ],).p(18),
            Text("Rashmika Sen",
            style: GoogleFonts.playfairDisplay(        color: Colors.white, fontSize: 30)),
            Row(
              children: [
                Text("Upcoming travel",
                    style: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold)).p(5),
                Spacer(),
                Text("+ Add",
                    style: TextStyle(color: Colors.amber,  fontWeight: FontWeight.bold)).p(5)
              ],
            ),
            SizedBox(height: 7,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
                Row(
                  children: [
                    Container(
                      width: 200,
                      decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.supervised_user_circle, color: Colors.white,),
                              Spacer(),
                              Text("+12 Joined Trip", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),),
                              Spacer(),
                              Text("19th June 2024", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white,),
                              Expanded(child: Text("Campus National Park", style: TextStyle(color: Colors.white),)),
                            ],
                          ),
                        ],
                      ).p(5),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.supervised_user_circle, color: Colors.white,),
                              Spacer(),
                              Text("+12 Joined Trip", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),),
                              Spacer(),
                              Text("19th June 2024", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white,),
                              Expanded(child: Text("Campus National Park", style: TextStyle(color: Colors.white),)),
                            ],
                          ),
                        ],
                      ).p(5),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.supervised_user_circle, color: Colors.white,),
                              Spacer(),
                              Text("+12 Joined Trip", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),),
                              Spacer(),
                              Text("19th June 2024", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white,),
                              Expanded(child: Text("Campus National Park", style: TextStyle(color: Colors.white),)),
                            ],
                          ),
                        ],
                      ).p(5),
                    ),
                  ],
                )
            )
          ],
          ),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ButtonBar(
      
                  children: [
                    ElevatedButton(onPressed: ()=>{}, child: Text("Languages", style: TextStyle(color: Colors.white),),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.white10),
            )),
                    ElevatedButton(onPressed: ()=>{}, child: Text("Ocean", style: TextStyle(color: Colors.white),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white10),
                        )),
                    ElevatedButton(onPressed: ()=>{}, child: Text("Climate", style: TextStyle(color: Colors.white),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white10),
                        )),
                    ElevatedButton(onPressed: ()=>{}, child: Text("Cuisine", style: TextStyle(color: Colors.white),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white10),
                        )),
                    ElevatedButton(onPressed: ()=>{}, child: Text("Mood", style: TextStyle(color: Colors.white),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white10),
                        )),
                  ],
                ),
              ),
              Row(
                children: [
                  Text('MY RECOMMENDATIONS',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  Spacer() ,
                  Text('More(243)',
                      style: TextStyle(color: Colors.white30, fontWeight: FontWeight.bold))
                ]
                ,).p(20),
              Stack(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * .12),
                          Transform.rotate(
                            angle: 6,
                            child:Container(
                                height: MediaQuery.of(context).size.height * .45,
                                width: MediaQuery.of(context).size.width * .5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage('lib/assets/travel3.jpg'),
                                      fit: BoxFit.cover
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * .12),

                          Transform.rotate(
                            angle: -6,
                            child:Container(
                                height: MediaQuery.of(context).size.height * .45,
                                width: MediaQuery.of(context).size.width * .5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage('lib/assets/travel2.jpg'),
                                      fit: BoxFit.cover
                                  ),
                                  
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                        height: MediaQuery.of(context).size.height * .55,
                        width: MediaQuery.of(context).size.width * .6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Icon(Icons.location_pin, color: Colors.white,), 
                              Text("Usa, California", style: TextStyle(color: Colors.white, fontSize: 13, shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 8.0,
                                  color: Color.fromARGB(125, 8, 8, 14),
                                ),
                              ],

                              ),)
                            ],).p(3),
                            Container(
                                width: MediaQuery.of(context).size.width * .3,
                                alignment: Alignment.bottomLeft,
                                child: Expanded(
                                  child: Text("Jamaicanism Valley",

                                    style: TextStyle(color: Colors.white, fontSize: 20, shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(1.0, 1.0),
                                        blurRadius: 3.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      Shadow(
                                        offset: Offset(1.0, 1.0),
                                        blurRadius: 8.0,
                                        color: Color.fromARGB(125, 8, 8, 14),
                                      ),
                                    ],),
                                  ),
                                )
                            ).p(3),
                            Container(
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color.fromRGBO(150, 150, 150, .5)),
                              child: Padding(
                                padding: const EdgeInsets. all(3.0),
                                child: Row(
                                children: [
                                  Icon(Icons.favorite_border, color: Colors.redAccent,size: 15,),
                                  Spacer(),
                                  Text("12", style: TextStyle(color: Colors.white, fontSize: 12),)
                                ],
                                                            ),
                              ),).p(5)
                          ],
                        ).p(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('lib/assets/travel1.jpg'),
                              fit: BoxFit.cover
                          ),
                        )),
                  ),

                ],
              ),





              //-----------------------------------------------------------------------
               //---------------------------------------------------
              Text(
                        'Hotel',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
              //----------------------------------------------------
               Text(
                        'Travel Modes',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
              //----------------------------------------------------
               Text(
                        'Experience',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
              
              Stack(
                children:[
                  Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                     width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.45,
                    
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Image.asset("lib/assets/travel1.jpg"),
                  ),
                ).pLTRB(0, 0, 5, 0),
                Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset("lib/assets/travel3.jpg"),
                          ),
                        ).pLTRB(0, 0, 10, 0),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height*0.45,
                            decoration: BoxDecoration(
                              
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset("lib/assets/travel2.jpg",
                                                                  fit: BoxFit.cover),
                          ),
                        ).pLTRB(0, 0, 15, 0),
                ]
                
              ),
////-------------------------------------------------------------------------------------------
              SizedBox(height: 100,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children : [
                    Stack(
                      children: [
                        Container(
                        height: MediaQuery.of(context).size.height * .5,
                        width: MediaQuery.of(context).size.width * .6,
                        child: Column(

                          children: [
                            SizedBox(height: MediaQuery.of(context).size.width * .025 ,),
                            Container(
                                width: MediaQuery.of(context).size.width * .55,
                                height: MediaQuery.of(context).size.width * .55,
                                decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .3),
                              image: const DecorationImage(
                                  image: AssetImage('lib/assets/SEAS.jpg'),
                                  fit: BoxFit.cover
                              ),
                            )),
                            SizedBox(height: 20,),
                            Text("Trip Suggestions", style: TextStyle(color: Colors.blueGrey)),
                            Center(
                              child: Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  child: Text("How Do You Like USA ?", textAlign: TextAlign.center,style: TextStyle(color: Color.fromRGBO(47, 63, 84, 1), fontSize: 30, fontWeight: FontWeight.bold))),
                            ),

                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(222, 240, 243, 1),
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .3)
                        ),
                      ),
                        Container(
                          width: MediaQuery.of(context).size.width * .6,
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height * .45),
                              Container(
                                width: MediaQuery.of(context).size.width * .20,
                                height: MediaQuery.of(context).size.width * .20,

                                child: Center(child: Text("ASK", style: TextStyle(color:Color.fromRGBO(47, 63, 84, 1), fontWeight: FontWeight.bold),)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .3),
                                  color: Color.fromRGBO(236, 201, 182, 1)
                                )),
                            ],
                          ),
                        ),]
                    ),
                    SizedBox(width: 10),
                    Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .5,
                            width: MediaQuery.of(context).size.width * .6,
                            child: Column(

                              children: [
                                SizedBox(height: MediaQuery.of(context).size.width * .025 ,),
                                Container(
                                    width: MediaQuery.of(context).size.width * .55,
                                    height: MediaQuery.of(context).size.width * .55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .3),
                                      image: const DecorationImage(
                                          image: AssetImage('lib/assets/SEAS.jpg'),
                                          fit: BoxFit.cover
                                      ),
                                    )),
                                SizedBox(height: 20,),
                                Text("Trip Suggestions", style: TextStyle(color: Colors.blueGrey)),
                                Center(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width * .5,
                                      child: Text("How Do You Like USA ?", textAlign: TextAlign.center,style: TextStyle(color: Color.fromRGBO(47, 63, 84, 1), fontSize: 30, fontWeight: FontWeight.bold))),
                                ),

                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(222, 240, 243, 1),
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .3)
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Column(
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height * .45),
                                Container(
                                    width: MediaQuery.of(context).size.width * .20,
                                    height: MediaQuery.of(context).size.width * .20,

                                    child: Center(child: Text("ASK", style: TextStyle(color:Color.fromRGBO(47, 63, 84, 1), fontWeight: FontWeight.bold),)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .3),
                                        color: Color.fromRGBO(236, 201, 182, 1)
                                    )),
                              ],
                            ),
                          ),]
                    ),
                    SizedBox(width: 10),
                    Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .5,
                            width: MediaQuery.of(context).size.width * .6,
                            child: Column(

                              children: [
                                SizedBox(height: MediaQuery.of(context).size.width * .025 ,),
                                Container(
                                    width: MediaQuery.of(context).size.width * .55,
                                    height: MediaQuery.of(context).size.width * .55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .3),
                                      image: const DecorationImage(
                                          image: AssetImage('lib/assets/SEAS.jpg'),
                                          fit: BoxFit.cover
                                      ),
                                    )),
                                SizedBox(height: 20,),
                                Text("Trip Suggestions", style: TextStyle(color: Colors.blueGrey)),
                                Center(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width * .5,
                                      child: Text("How Do You Like USA ?", textAlign: TextAlign.center,style: TextStyle(color: Color.fromRGBO(47, 63, 84, 1), fontSize: 30, fontWeight: FontWeight.bold))),
                                ),

                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(222, 240, 243, 1),
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .3)
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Column(
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height * .45),
                                Container(
                                    width: MediaQuery.of(context).size.width * .20,
                                    height: MediaQuery.of(context).size.width * .20,

                                    child: Center(child: Text("ASK", style: TextStyle(color:Color.fromRGBO(47, 63, 84, 1), fontWeight: FontWeight.bold),)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .3),
                                        color: Color.fromRGBO(236, 201, 182, 1)
                                    )),
                              ],
                            ),
                          ),]
                    ),
                    SizedBox(width: 10),
                    Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .5,
                            width: MediaQuery.of(context).size.width * .6,
                            child: Column(

                              children: [
                                SizedBox(height: MediaQuery.of(context).size.width * .025 ,),
                                Container(
                                    width: MediaQuery.of(context).size.width * .55,
                                    height: MediaQuery.of(context).size.width * .55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .3),
                                      image: const DecorationImage(
                                          image: AssetImage('lib/assets/SEAS.jpg'),
                                          fit: BoxFit.cover
                                      ),
                                    )),
                                SizedBox(height: 20,),
                                Text("Trip Suggestions", style: TextStyle(color: Colors.blueGrey)),
                                Center(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width * .5,
                                      child: Text("How Do You Like USA ?", textAlign: TextAlign.center,style: TextStyle(color: Color.fromRGBO(47, 63, 84, 1), fontSize: 30, fontWeight: FontWeight.bold))),
                                ),

                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(222, 240, 243, 1),
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .3)
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Column(
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height * .45),
                                Container(
                                    width: MediaQuery.of(context).size.width * .20,
                                    height: MediaQuery.of(context).size.width * .20,

                                    child: Center(child: Text("ASK", style: TextStyle(color:Color.fromRGBO(47, 63, 84, 1), fontWeight: FontWeight.bold),)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .3),
                                        color: Color.fromRGBO(236, 201, 182, 1)
                                    )),
                              ],
                            ),
                          ),]
                    ),
                  ]
                ),
              ),
              SizedBox(height: 800,)
            ],
          )
        ],
      ),
    ),
    ),
    )

    ],
    );
  }
}
