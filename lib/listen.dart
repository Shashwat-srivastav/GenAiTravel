import 'package:flutter/material.dart';
import 'package:gen_ai_travel/schedule.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:speech_to_text/speech_to_text.dart' ;

class Listening extends StatefulWidget {
  const Listening({super.key});

  @override
  State<Listening> createState() => _ListeningState();
}

class _ListeningState extends State<Listening> {

  var Gotit="jaipur";
  final SpeechToText _speechToText = SpeechToText();
   bool _speechEnabled = false;
  String _lastWords = '';

   @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

   void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }


  final myController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          elevation: 0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          onPressed:
              _speechToText.isNotListening ? _startListening : _stopListening,
          tooltip: 'Listen',
          child: Container(
            height: 150,
            width: 150,
              decoration: BoxDecoration(
                  
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 79, 144, 219),
                        Colors.white,
                      ],
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter)),
            child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic)),
        ),
         appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: "Voice Command".text.minFontSize(32).blue300.make(),
        ),
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
            SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.83,
                  width: MediaQuery.of(context).size.width,
                 
                  child: 
                  
                  TextField(
                    maxLines: 40,
                    controller: TextEditingController(
                      text: _lastWords
                    
                    ),
                    onChanged: (value) {
                      
                      // setState(() {
                        _lastWords = value;
                        Gotit=_lastWords;
                      // });
                    },
                    style: TextStyle(fontSize: 36,fontWeight: FontWeight.w300,color: Colors.white54),
                    
                    decoration: InputDecoration(
                    helperText: _speechToText.isListening  ? '$_lastWords'
                        : _speechEnabled
                            ? 'Tap the microphone to start listening...'
                            : 'Speech not available',

                  ),).pLTRB(50, 150, 10, 0),
                  ),
                  
                  
                  
                //   Text(
                    
                //     _speechToText.isListening
                //         ? '$_lastWords'
                      
                //         : _speechEnabled
                //             ? 'Tap the microphone to start listening...'
                //             : 'Speech not available',
                //             style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w200),
                //   ).pLTRB(50, 150, 10, 0),
                // ).p(25),
                ElevatedButton(onPressed: (){
                  Get.to(Scheduler(text:Gotit));
                }, child: "next".text.make(),
                
                )
              ],
            ),
          ),]
        ),
      ),
    );
  }
}