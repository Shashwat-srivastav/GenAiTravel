import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gen_ai_travel/APIclasses.dart';
import 'package:get/get.dart';
import 'package:groq/groq.dart';
import "package:http/http.dart" as http;
import 'package:velocity_x/velocity_x.dart';

class Reccomendation extends StatefulWidget {
  const Reccomendation({super.key});

  @override
  State<Reccomendation> createState() => _ReccomendationState();
}

class _ReccomendationState extends State<Reccomendation> {


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


   List<Place> l = [];
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
      ),body: {"query": "Jaipur"});

    var responseDecoded =jsonDecode(resp.body);
    //  print(jsonDecode(resp.body)['data']['places'][0]);
     

     int x= responseDecoded['data']['places'].length;

     print(x);
     print(responseDecoded['data']['places'][0]["name"]);
     print(responseDecoded['data']['places'][0]);
     print(responseDecoded['data']['places'][0]["location"]);
      print(responseDecoded['data']['places'][0]["description"]);
       print(responseDecoded['data']['places'][0]["image_link"]);
        print(responseDecoded['data']['places'][0]["attraction"]);
        //  print(responseDecoded['data']['places'][0]["childrenAllowed"]);
    print(responseDecoded['data']['places'][0]["VisitTime"]);


       var y= responseDecoded['data']['places'];
      print(y);


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
       print(p);
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
              print(l);
              return GridView.builder(itemCount: l.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (BuildContext,x){
                return Card(child: Container(
                                height: MediaQuery.of(context).size.height * .25,
                                width: MediaQuery.of(context).size.width * .25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image:  DecorationImage(
                                      image: NetworkImage(l[x].img),
                                      fit: BoxFit.cover
                                  ),
                                  
                                )),);

                
              });
            } else {
              return CircularProgressIndicator().centered();
            }
          }),
    ));
  }
}
/*sdfghkjhjcffgugffhgftgyutyyuttdtretfugutfyyiuihuhfgfh;gi;yfulfhgyyfhhgiyuuyuthgjj*/