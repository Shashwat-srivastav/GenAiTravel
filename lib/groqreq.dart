// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groq/groq.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:gen_ai_travel/APIclasses.dart';

class Reccomendation extends StatefulWidget {
 
  var text;
   Reccomendation({
    Key? key,
  
    required this.text,
  }) : super(key: key);

  @override
  State<Reccomendation> createState() => _ReccomendationState();
}

class _ReccomendationState extends State<Reccomendation> {



late EstimateCost cost;

//   final groq = Groq(
//     apiKey: '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',
//     model: GroqModel.gemma,
//     //  configuration: TextTreeConfiguration()            "response_format": {"type": "json_object"}
//     //  const String.fromEnvironment('groqApiKey')
//     // dotenv.env['groqApiKey']!
//   );
//   var prompt = 'travel';
//   var result = "";

//   Future getresponse(String str) async {
//     groq.startChat();
//     print("hello");

//     try {
//       var text =
//           '''You're an experienced ${str} app developer who has created multiple successful applications in the past. Your specialization lies in designing user-friendly interfaces, integrating cutting-edge features, and ensuring a seamless experience of all kinds.
// Your task is to guide me through building an application. Here's the information you need to provide:
// - Name of the  App: ________
// - Key Features to Include: ________
// - Resources Required (APIs, databases, etc.): ________
// - Best Tech Stack Recommendation: ________
// - Basic User Flow Outline: ________
// - Tasks to Include in the Project: ________
// - best ui/ux resources to take inspiration from _____
// ''';
//       GroqResponse response = await groq.sendMessage(
//         text,
//       );

// print(response.choices.first.message.content);
//       print(response.choices.last.message.content);
//       result = response.choices.last.message.content;
//     } on GroqException catch (error) {
//       print(error.message);
//     }
//   }

//   Future postdata() async {
//     print(123);

//     var response = await http.post(
//         Uri.http("api.groq.com", "/openai/v1/chat/completions"),
//         headers: {
//           "Authorization": "Bearer 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" ,
//            "Content-Type": "application/json"
//         },
//         body: {
//           "messages": [
//             {
//               "role": "user",
//               "content": "Explain the importance of low latency LLMs"
//             }
//           ],
//           "model": "mixtral-8x7b-32768"
//         });
//     print("x");
//     print(response);
//     print(response.body);
//   }

   List<String> hotel=[];
   List<Place> l = [];
  List<String> travelmode = [];
  List<String> experiences = [];
 List<DayWise> dw =[];
  String acc = '';
  String act = '';
  String foo = '';
  String tra = '';

  Future req() async{
        print("hey");
    // var r= await http.post(Uri.http("genaitravelbackend.onrender.com","/api/v1/query"),
    //     body: <String,String>{"query": "Mumbai"});
    //     var x= jsonDecode(r.body);
    //     print(x);
    //     print("1234");
    

    var resp = await http.post(Uri.parse(
      "http://192.168.8.7:4000/api/v1/query"
      // "https://genaitravelbackend.onrender.com/api/v1/query"
      ),body: {"query": widget.text});

    var responseDecoded =jsonDecode(resp.body);
    //  print(jsonDecode(resp.body)['data']['places'][0]);
     

     int x= responseDecoded['data']['places'].length;
     print(responseDecoded['data']['dayWiseItinerary']);
     acc = responseDecoded['data']['estimatedCost']['accomodation'];
     act = responseDecoded['data']['estimatedCost']['activities'];
     foo = responseDecoded['data']['estimatedCost']['food'];
     tra = responseDecoded['data']['estimatedCost']['transport'];
      var day=responseDecoded['data']['dayWiseItinerary'] ;
        print(day.length);
        print(day);
      for(int i=0;i<day.length;i++)
        {
          print(i);
          print(day[i]['places']);
          List<String> c=[];
          for(int j=0;j<day[i]['places'].length;j++)
            {
              c.add(day[i]['places'][j]);
            }
          print("-----------------");
          print(day[i]['day']);
          DayWise d = new DayWise(item: day[i]['day'], places: c);
          dw.add(d);
        }



     var cost= EstimateCost(accomodate: responseDecoded['data']['estimatedCost']['accomodation'], activity: responseDecoded['data']['estimatedCost']['activities'], food: responseDecoded['data']['estimatedCost']['food'], transport: responseDecoded['data']['estimatedCost']['transport']);
     print(cost);
    //  print(x);
    //  print(responseDecoded['data']['places'][0]["name"]);
    // print(responseDecoded['data']['places'][0]);
    //  print(responseDecoded['data']['places'][0]["location"]);
    //   print(responseDecoded['data']['places'][0]["description"]);
    //    print(responseDecoded['data']['places'][0]["image_link"]);
    //     print(responseDecoded['data']['places'][0]["attraction"]);
    //     //  print(responseDecoded['data']['places'][0]["childrenAllowed"]);
    // print(responseDecoded['data']['places'][0]["VisitTime"]);


      //  var y= responseDecoded['data']['places'];
      // print(y);

      //  var hotel =responseDecoded['data']["hotels"];
      for(int i=0;i<responseDecoded['data']["hotels"].length;i++)
      {
          hotel.add(responseDecoded['data']["hotels"][i]);
      }
        for(int i=0;i<responseDecoded['data']["transport"].length;i++)
        {
          travelmode.add(responseDecoded['data']["transport"][i]);
        }
        for(int i=0;i<responseDecoded['data']["experiences"].length;i++)
        {
          experiences.add(responseDecoded['data']["experiences"][i]);
        }
        print(travelmode);
        // List<Place> Places =
        // List.from(y).map<Place>((item) => Place.fromMap(item)).toList();
        // print(Places);
  
   
    for(int i=0;i<x;i++)
    {
       Place p = new Place(name: responseDecoded['data']['places'][i]["name"],
        location: responseDecoded['data']['places'][i]["location"], 
        img: responseDecoded['data']['places'][i]["image_link"],
         desc: responseDecoded['data']['places'][i]["description"],
          attract: responseDecoded['data']['places'][i]["attraction"],
           visitTime: responseDecoded['data']['places'][i]["VisitTime"],
            ChildAllow: responseDecoded['data']['places'][i]["childrenAllowed"]);
      //  print(p);
       l.add(p);
      //  print(l);
    }

    // print(l);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: 
      // ElevatedButton(child: "hey".text.make(), onPressed: ()=> {req()},).centered()
      
      FutureBuilder(
          future: req(),
          builder: (BuildContext, AsyncSnapshot) {
            if (AsyncSnapshot.connectionState ==ConnectionState.done) {
              // print(l);
              
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
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.navigate_before,
                      color: Colors.white,
                    ).p(2)),
              ),
              title: Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        alignment: Alignment.topRight,
                        child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white12, width: 3.0),
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              Icons.notifications_none_outlined,
                              color: Colors.white,
                            ).p(2)))
                  ],
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
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Explorer",
                              style: TextStyle(color: Colors.amber),
                            ),
                            SizedBox.fromSize(size: Size.square(10)),
                            Text(
                              "-",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox.fromSize(size: Size.square(10)),
                            Text(
                              "May 2021",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ).p(18),
                        Text("Rashmika Sen",
                            style: GoogleFonts.playfairDisplay(
                                color: Colors.white, fontSize: 30)),
                        Row(
                          children: [
                            Text("Upcoming travel",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                                .p(5),
                            Spacer(),
                            Text("+ Add",
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold))
                                .p(5)
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.supervised_user_circle,
                                            color: Colors.white,
                                          ),
                                          Spacer(),
                                          Text(
                                            "+12 Joined Trip",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            "19th June 2024",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          ),
                                          Expanded(
                                              child: Text(
                                            "Campus National Park",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                        ],
                                      ),
                                    ],
                                  ).p(5),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.supervised_user_circle,
                                            color: Colors.white,
                                          ),
                                          Spacer(),
                                          Text(
                                            "+12 Joined Trip",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            "19th June 2024",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          ),
                                          Expanded(
                                              child: Text(
                                            "Campus National Park",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                        ],
                                      ),
                                    ],
                                  ).p(5),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.supervised_user_circle,
                                            color: Colors.white,
                                          ),
                                          Spacer(),
                                          Text(
                                            "+12 Joined Trip",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            "19th June 2024",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          ),
                                          Expanded(
                                              child: Text(
                                            "Campus National Park",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                        ],
                                      ),
                                    ],
                                  ).p(5),
                                ),
                              ],
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ButtonBar(
                            children: [
                              ElevatedButton(
                                  onPressed: () => {},
                                  child: Text(
                                    "Languages",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.white10),
                                  )),
                              ElevatedButton(
                                  onPressed: () => {},
                                  child: Text(
                                    "Ocean",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.white10),
                                  )),
                              ElevatedButton(
                                  onPressed: () => {},
                                  child: Text(
                                    "Climate",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.white10),
                                  )),
                              ElevatedButton(
                                  onPressed: () => {},
                                  child: Text(
                                    "Cuisine",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.white10),
                                  )),
                              ElevatedButton(
                                  onPressed: () => {},
                                  child: Text(
                                    "Mood",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.white10),
                                  )),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'TOP ATTRACTIONS',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text('More(243)',
                                style: TextStyle(
                                    color: Colors.white30,
                                    fontWeight: FontWeight.bold))
                          ],
                        ).p(20),
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
                                  image: DecorationImage(
                                      image: NetworkImage(l[0].img),
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
                                  image: DecorationImage(
                                      image: NetworkImage(l[1].img),
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
                        height: MediaQuery.of(context).size.height * .555,
                        width: MediaQuery.of(context).size.width * .6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Icon(Icons.location_pin, color: Colors.white,),
                              Text(l[2].location, style: TextStyle(color: Colors.white, fontSize: 13, shadows: <Shadow>[
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
                                  child: Text(l[2].name,

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
                          image: DecorationImage(
                              image: NetworkImage(l[2].img),
                              fit: BoxFit.cover
                          ),
                        )),
                  ),

                ],
              ),
//---------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------
SizedBox(height: 100),

//--------------------------------------------------------------------------------------------------------------------------------
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'HOTELS',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ).p(5),
                        ),

                        Container(
                          height : MediaQuery.of(context).size.height*.05,
                          width: MediaQuery.of(context).size.width*0.95,
                          child: ListView.builder(itemCount: hotel.length,scrollDirection: Axis.horizontal,itemBuilder: (BuildContext,x){
                            return  ElevatedButton(
                                  onPressed: () => {},
                                  child: Text(
                                    hotel[x],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.white10),
                                  )).p(5);
                          }),
                        )


//-----------------------------------------------------------------                        
                        //----------------------------------------------------
                        , Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'TRANSPORT',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ).p(5),
              ),
                        Container(
                          height : MediaQuery.of(context).size.height*.05,
                          width: MediaQuery.of(context).size.width*0.95,
                          child: ListView.builder(itemCount: travelmode.length,scrollDirection: Axis.horizontal,itemBuilder: (BuildContext,x){
                            return  ElevatedButton(
                                onPressed: () => {},
                                child: Text(
                                  travelmode[x],
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStatePropertyAll<Color>(
                                      Colors.white10),
                                )).p(5);
                          }),
                        ),
                        //----------------------------------------------------
                   Container(
                  width: MediaQuery.of(context).size.width,
              child: Text(
                'EXPERIENCES',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ).p(5),
            ),
            Container(
              height : MediaQuery.of(context).size.height*.05,
              width: MediaQuery.of(context).size.width*0.95,
              child: ListView.builder(itemCount: experiences.length,scrollDirection: Axis.horizontal,itemBuilder: (BuildContext,x){
                return  ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      experiences[x],
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll<Color>(
                          Colors.white10),
                    )).p(5);
              }),
            ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'ITINERARY',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.amber, fontWeight: FontWeight.bold),
                          ).p(5),
                        ),
            Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.45,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border(
                            top: BorderSide(width: 2.0, color: Colors.white),
                            bottom: BorderSide(width: 2.0, color: Colors.white),
                          )),
                          child: ListView.builder(itemCount: l.length,itemBuilder: (BuildContext,x){
                            return Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 58, 49, 49)
                                      .withOpacity(0.5),
                                  borderRadius:
                                  BorderRadius.only(
                                      bottomRight: Radius.circular(20)
                                      ,
                                      topLeft:
                                      Radius.circular(
                                          20))),

                              child: Row(children: [
                                Container(width: MediaQuery.of(context)
                                    .size
                                    .width*0.4,
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *0.2

                                    ,child: Image.network(l[x].img,fit: BoxFit.cover,)),
                                Column(
                                  children: [
                                    Container(width:MediaQuery.of(context)
                                        .size
                                        .width*0.4,child: l[x].name.text.white.minFontSize(20).make()).pLTRB(10, 0, 0,50),
                                    Container(width:MediaQuery.of(context)
                                        .size
                                        .width*0.4,child: l[x].attract.text.red200.make()),
                                    Container(width:MediaQuery.of(context)
                                        .size
                                        .width*0.4,child: l[x].visitTime.text.amber100.make())
                                  ],
                                )

                              ],),
                            ).p(10);


                            // ListTile(


                            //   leading:
                            //      Container(width: MediaQuery.of(context)
                            //                     .size
                            //                     .width*0.2,
                            //                 height: MediaQuery.of(context)
                            //                         .size
                            //                         .height *
                            //                     0.3
                            //       ,child: Image.network(l[x].img,fit: BoxFit.cover,)),
                            //   title: l[x].name.text.white.make(),
                            //   subtitle: l[x].attract.text.white.make(),

                            // );
                          }),
                        ),
                        SizedBox(height: 100),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'DAYWISE ITINEARY',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ).p(5),
                        ).p(10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height : MediaQuery.of(context).size.height*.30,
                            width: MediaQuery.of(context).size.width,
                            //decoration: BoxDecoration(image:DecorationImage(image: AssetImage('lib/assets/DayWiseLine.png'), fit: BoxFit.cover)),
                            child: ListView.builder(itemCount: dw.length,scrollDirection: Axis.horizontal,itemBuilder: (BuildContext,x){
                              return  Column(
                                children: [
                                  Container(
                                    height : MediaQuery.of(context).size.height*.1,
                                    width: MediaQuery.of(context).size.width*.35,
                                    decoration: BoxDecoration(image:DecorationImage(image: AssetImage('lib/assets/DayLine.png'), fit: BoxFit.cover)),
                                  ),
                                  for(int m = 0; m < dw[x].places.length; m++)
                                    Text('|', style: TextStyle(color: Colors.white, fontSize: 6)),
                                  for(int m = 0; m < dw[x].places.length; m++)
                                    Text('|', style: TextStyle(color: Colors.white, fontSize: 6)),
                                  Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(color: Color.fromRGBO(56, 58, 60, 1),
                                        borderRadius:
                                        BorderRadius.only(
                                            bottomRight: Radius.circular(20)
                                            ,
                                            topLeft:
                                            Radius.circular(
                                                20)),
                                  ),
                                    width: MediaQuery.of(context).size.width*.3,
                                      child: Column(
                                        children: [
                                          Text(
                                            dw[x].item,
                                            style: TextStyle(color: Colors.amber),
                                          ),
                                          for(var i = 0; i < dw[x].places.length; i++ )
                                            Text(dw[x].places[i], style: TextStyle(color: Colors.white))
                                        ],
                                      ).p(4),
                                      ).p(5),
                                ],
                              );
                            })
                            ),
                        ),
                        ////--
                        SizedBox(height: 50),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'ESTIMATED COSTS',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ).p(5),
                        ).p(10),
                        Container(
                          width: MediaQuery.of(context)
                            .size
                            .width*0.9,
                          decoration : BoxDecoration(color: Colors.white10,borderRadius:  BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20) ),border: Border(
                          left: BorderSide(width: 1.0, color: Colors.white),
                          right: BorderSide(width: 1.0, color: Colors.white),)),
                            child:Column(
                          children :[
                            Row(
                                children : [
                                  Text("Accomodation", style: TextStyle(color: Colors.white)),
                                  Spacer(),
                                  Text(acc, style: TextStyle(color: Colors.white))
                                ]
                            ).p(3),
                            Row(
                                children : [
                                  Text("Activities", style: TextStyle(color: Colors.white)),
                                  Spacer(),
                                  Text(act, style: TextStyle(color: Colors.white))
                                ]
                            ).p(3),
                            Row(
                                children : [
                                  Text("Food", style: TextStyle(color: Colors.white)),
                                  Spacer(),
                                  Text(foo, style: TextStyle(color: Colors.white))
                                ]
                            ).p(3),
                            Row(
                                children : [
                                  Text("Travel", style: TextStyle(color: Colors.white)),
                                  Spacer(),
                                  Text(tra, style: TextStyle(color: Colors.white))
                                ]
                            ).p(3),
                          ]
                        ).p(10)
                        ),
                        ////-------------------------------------------------------------------------------------------
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'HISTORY',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ).p(5),
                        ).p(10),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            Stack(children: [
                              Container(
                                height: MediaQuery.of(context).size.height * .5,
                                width: MediaQuery.of(context).size.width * .6,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.width *
                                          .025,
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width *
                                            .55,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .55,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.of(context).size.width *
                                                  .3),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'lib/assets/SEAS.jpg'),
                                              fit: BoxFit.cover),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Trip Suggestions",
                                        style: TextStyle(color: Colors.blueGrey)),
                                    Center(
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  .5,
                                          child: Text("How Do You Like USA ?",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      47, 63, 84, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold))),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(222, 240, 243, 1),
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width * .3)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .6,
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .45),
                                    Container(
                                        width: MediaQuery.of(context).size.width *
                                            .20,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .20,
                                        child: Center(
                                            child: Text(
                                          "ASK",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(47, 63, 84, 1),
                                              fontWeight: FontWeight.bold),
                                        )),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .3),
                                            color: Color.fromRGBO(
                                                236, 201, 182, 1))),
                                  ],
                                ),
                              ),
                            ]),
                            SizedBox(width: 10),
                            Stack(children: [
                              Container(
                                height: MediaQuery.of(context).size.height * .5,
                                width: MediaQuery.of(context).size.width * .6,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.width *
                                          .025,
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width *
                                            .55,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .55,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.of(context).size.width *
                                                  .3),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'lib/assets/SEAS.jpg'),
                                              fit: BoxFit.cover),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Trip Suggestions",
                                        style: TextStyle(color: Colors.blueGrey)),
                                    Center(
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  .5,
                                          child: Text("How Do You Like USA ?",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      47, 63, 84, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold))),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(222, 240, 243, 1),
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width * .3)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .6,
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .45),
                                    Container(
                                        width: MediaQuery.of(context).size.width *
                                            .20,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .20,
                                        child: Center(
                                            child: Text(
                                          "ASK",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(47, 63, 84, 1),
                                              fontWeight: FontWeight.bold),
                                        )),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .3),
                                            color: Color.fromRGBO(
                                                236, 201, 182, 1))),
                                  ],
                                ),
                              ),
                            ]),
                            SizedBox(width: 10),
                            Stack(children: [
                              Container(
                                height: MediaQuery.of(context).size.height * .5,
                                width: MediaQuery.of(context).size.width * .6,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.width *
                                          .025,
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width *
                                            .55,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .55,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.of(context).size.width *
                                                  .3),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'lib/assets/SEAS.jpg'),
                                              fit: BoxFit.cover),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Trip Suggestions",
                                        style: TextStyle(color: Colors.blueGrey)),
                                    Center(
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  .5,
                                          child: Text("How Do You Like USA ?",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      47, 63, 84, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold))),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(222, 240, 243, 1),
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width * .3)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .6,
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .45),
                                    Container(
                                        width: MediaQuery.of(context).size.width *
                                            .20,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .20,
                                        child: Center(
                                            child: Text(
                                          "ASK",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(47, 63, 84, 1),
                                              fontWeight: FontWeight.bold),
                                        )),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .3),
                                            color: Color.fromRGBO(
                                                236, 201, 182, 1))),
                                  ],
                                ),
                              ),
                            ]),
                            SizedBox(width: 10),
                            Stack(children: [
                              Container(
                                height: MediaQuery.of(context).size.height * .5,
                                width: MediaQuery.of(context).size.width * .6,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.width *
                                          .025,
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width *
                                            .55,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .55,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.of(context).size.width *
                                                  .3),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'lib/assets/SEAS.jpg'),
                                              fit: BoxFit.cover),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Trip Suggestions",
                                        style: TextStyle(color: Colors.blueGrey)),
                                    Center(
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  .5,
                                          child: Text("How Do You Like USA ?",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      47, 63, 84, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold))),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(222, 240, 243, 1),
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width * .3)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .6,
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .45),
                                    Container(
                                        width: MediaQuery.of(context).size.width *
                                            .20,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .20,
                                        child: Center(
                                            child: Text(
                                          "ASK",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(47, 63, 84, 1),
                                              fontWeight: FontWeight.bold),
                                        )),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .3),
                                            color: Color.fromRGBO(
                                                236, 201, 182, 1))),
                                  ],
                                ),
                              ),
                            ]),
                          ]),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
                 
              
            } else {
              return CircularProgressIndicator().centered();
            }
          }),
    ));
  }
}
/*sdfghkjhjcffgugffhgftgyutyyuttdtretfugutfyyiuihuhfgfh;gi;yfulfhgyyfhhgiyuuyuthgjj*/