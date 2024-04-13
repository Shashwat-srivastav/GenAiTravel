import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  Future req() async{
        print("hey");
    var r= await http.post(Uri.http("genaitravelbackend.onrender.com","/api/v1/query"),
        body: <String,String>{"query": "Mumbai"});
    print(r.body);

    // var resp = await http.post(Uri.parse("https://genaitravelbackend.onrender.com/api/v1/query"),body: {"query": "delhi"});
    // print(resp.toString());
    // print(resp.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FutureBuilder(
          future: req(),
          builder: (BuildContext, AsyncSnapshot) {
            if (AsyncSnapshot != false) {
              return ElevatedButton(child: "hey".text.make(), onPressed: ()=> {req()},).centered();
            } else {
              return CircularProgressIndicator();
            }
          }),
    ));
  }
}
