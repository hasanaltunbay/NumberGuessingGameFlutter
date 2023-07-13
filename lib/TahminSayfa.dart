import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayitahmin/SonucSayfa.dart';

class TahminSayfa extends StatefulWidget {
  const TahminSayfa({super.key});

  @override
  State<TahminSayfa> createState() => _TahminSayfaState();
}

class _TahminSayfaState extends State<TahminSayfa> {

  var textFieldTahmin=TextEditingController();
  int rasgeleSayi=0;
  int kalanHak=5;
  String ipucu="";
  String deger="";

  @override
  void initState() {
    super.initState();
    rasgeleSayi=Random().nextInt(101);
    print("Rasgele Sayi : $rasgeleSayi");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Tahmin Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Kalan Hak: $kalanHak",style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 30),),
            Text("İpucu : $ipucu",style: TextStyle(color: Colors.black,fontSize: 25),),
            Text("İpucu 2 : $deger"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textFieldTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tahmin Et",style: TextStyle(color: Colors.black,),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green
                ),
                onPressed: (){

                  setState(() {
                    kalanHak=kalanHak-1;
                  });

                  int tahmin=int.parse(textFieldTahmin.text);

                  if(tahmin==rasgeleSayi){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>SonucSayfa(sonuc: true)));
                    return;
                  }

                  if(tahmin>rasgeleSayi){
                    setState(() {
                      if(tahmin-rasgeleSayi<=5){
                        deger="Çok Yakın";
                      }else{
                        deger="Uzak";
                      }
                      ipucu="Tahmini Azalt";
                    });
                  }
                  if(tahmin<rasgeleSayi){
                    setState(() {
                      if(rasgeleSayi-tahmin<=5){
                        deger="Çok Yakın";
                      }else{
                        deger="Uzak";
                      }
                      ipucu="Tahmini Arttır";
                    });
                  }
                  if(kalanHak==0){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>SonucSayfa(sonuc: false)));

                  }
                  textFieldTahmin.text="";


                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
