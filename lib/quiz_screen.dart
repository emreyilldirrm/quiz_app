import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quiz_app/Flag_D_A_O.dart';
import 'package:quiz_app/Flags.dart';
import 'package:quiz_app/result_screen.dart';

class quize_screen extends StatefulWidget {
  const quize_screen({super.key});

  @override
  State<quize_screen> createState() => _quize_screenState();
}

class _quize_screenState extends State<quize_screen> {

  var questions = <Flags>[];
  var wrong_options = <Flags>[];
  late Flags  correct_question;
  var all_options=HashSet<Flags>();

  int question_counter=0;
  int true_counter=0;
  int false_counter=0;

  String bayrak_resim_adi="placeholder.png";
  String AbuttonText="";
  String BbuttonText="";
  String CbuttonText="";
  String DbuttonText="";

  @override
  void initState() {
    super.initState();
    bring_the_questions();
  }

  Future<void> bring_the_questions() async {
    questions= await Flags_D_A_O().Randomly_fetch_5_data();

    upload_question();

  }

  Future<void> upload_question() async {
    correct_question=questions[question_counter];
    bayrak_resim_adi=correct_question.bayrak_resim;

    wrong_options= await Flags_D_A_O().randomly_fetch_3_wrong_data(correct_question.bayrak_id);

    all_options.clear();
    all_options.add(correct_question);
    all_options.add(wrong_options[0]);
    all_options.add(wrong_options[1]);
    all_options.add(wrong_options[2]);

    AbuttonText=all_options.elementAt(0).bayrak_ad;
    BbuttonText=all_options.elementAt(1).bayrak_ad;
    CbuttonText=all_options.elementAt(2).bayrak_ad;
    DbuttonText=all_options.elementAt(3).bayrak_ad;

    setState(() {

    });

  }

  void question_counter_check(){
    question_counter=question_counter+1;

    if(question_counter !=5){
      upload_question();
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => result_screen(number_of_correct: true_counter),));
    }
  }

  void Is_it_true_or_not(String buttontext){
    if(correct_question.bayrak_ad == buttontext){
      true_counter=true_counter+1;
    }else{
      false_counter=false_counter+1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Quize Screen") ,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Doğru Sayısı : $true_counter ",style: TextStyle(fontSize: 15,color: Colors.green),),
                Text("Yanlış Sayısı : $false_counter",style: TextStyle(fontSize: 15,color: Colors.red),)
              ]),

              question_counter !=5 ? Text("${question_counter}.soru :",style: TextStyle(fontSize: 30),)
                  : Text("5.soru :",style: TextStyle(fontSize: 30),),

              Image.asset("image/${bayrak_resim_adi}"),

              TextButton(onPressed: () {
                question_counter_check();
                Is_it_true_or_not(AbuttonText);
                }, child: Text(AbuttonText)),

              TextButton(onPressed: () {
                question_counter_check();
                Is_it_true_or_not(BbuttonText);
              }, child: Text(BbuttonText)),

              TextButton(onPressed: () {
                question_counter_check();
                Is_it_true_or_not(CbuttonText);
              }, child: Text(CbuttonText)),

              TextButton(onPressed: () {
                question_counter_check();
                Is_it_true_or_not(DbuttonText);
              }
              , child: Text(DbuttonText))


          ],
        ),
      ),
    );
  }
}
