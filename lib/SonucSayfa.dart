import 'package:flutter/material.dart';

class SonucSayfa extends StatefulWidget {

  bool sonuc;

  SonucSayfa({required this.sonuc});

  @override
  State<SonucSayfa> createState() => _SonucSayfaState();
}

class _SonucSayfaState extends State<SonucSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Sonuc Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc ? Image.asset("resimler/dogru.png") : Image.asset("resimler/false.png"),
            Text(widget.sonuc ? "Kazandınız " : "Kaybettiniz",style: TextStyle(color: Colors.black,fontSize: 35),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tekrar Dene",style: TextStyle(color: Colors.black,),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
