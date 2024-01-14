import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({super.key});

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101); // 0 - 100 arası sayı üretir.
    print("Rastgele Sayı: $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kalan Hak: $kalanHak",
              style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 36,
              ),
            ),
            Text(
              "Yardım: $yonlendirme",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 36,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tahmin Et", style: TextStyle(fontSize: 18),),
                onPressed: (){
                  print("Butona tıklandı");

                  setState(() {
                    kalanHak -= 1;
                  });

                  int tahmin = int.parse(tfTahmin.text);

                  if(tahmin == rastgeleSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true)));
                    return;
                  }
                  if(tahmin > rastgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini Azalt";
                    });
                  }
                  if(tahmin < rastgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini Arttır";
                    });
                  }
                  if(kalanHak == 0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: false)));
                  }
                  tfTahmin.text = "";
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
