import 'package:flutter/material.dart';
import 'package:sayitahmin/TahminSayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {


  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Tahmin Oyunu",style: TextStyle(color: Colors.black,fontSize: 35),),
              Image.asset("resimler/zar.jpg"),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text("Oyuna Başla",style: TextStyle(color: Colors.black,),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red
                  ),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>TahminSayfa()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
