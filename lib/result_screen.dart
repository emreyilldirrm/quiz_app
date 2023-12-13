import 'package:flutter/material.dart';

class result_screen extends StatefulWidget {
  int number_of_correct;

  result_screen({required this.number_of_correct});

  @override
  State<result_screen> createState() => _result_screenState();
}

class _result_screenState extends State<result_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Result Screen") ,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[

            Text("Doğru Sayısı : ${widget.number_of_correct}",style: TextStyle(fontSize: 30),),
            Text("Yanlış Sayısı : ${5-widget.number_of_correct}",style: TextStyle(fontSize: 30),),

            Text("Başarı Oranı : %${((widget.number_of_correct*100)/5).toInt()}",style: TextStyle(fontSize: 30),),

            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Tekrar Dene"))
          ],
        ),
      ),
    );
  }
}
