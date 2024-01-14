import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/TahminEkrani.dart';

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
      home: Anasayfa(),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Tahmin Oyunu",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 36,
                ),
              ),
            ),
            Image.asset("resimler/zar.png", width: 150, height: 150),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Oyun Başla", style: TextStyle(fontSize: 18, color: Colors.purple),),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.inversePrimary,
                ),
                onPressed: (){
                  print("Butona tıklandı");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TahminEkrani()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
