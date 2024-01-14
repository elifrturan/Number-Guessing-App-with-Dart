import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/main.dart';

class SonucEkrani extends StatefulWidget {

  bool sonuc;

  SonucEkrani({required this.sonuc});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.sonuc ? "Tebrikler! Kazandınız." : "Üzgünüz! Kaybettiniz...",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 36,
                ),
              ),
            ),
            widget.sonuc ? Image.asset("resimler/happy.png", width: 150, height: 150) : Image.asset("resimler/unhappy.png", width: 150, height: 150),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tekrar Dene", style: TextStyle(fontSize: 18),),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.inversePrimary,
                ),
                onPressed: (){
                  print("Butona tıklandı");
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
