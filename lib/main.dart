import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Yemek Tarifi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            SizedBox(
                width: ekranGenisligi,
                child: Image.asset("resim/manti.jpg")
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi/8,
                    child: TextButton(
                      child: Yazi("Beğen",ekranGenisligi/25),
                      style:TextButton.styleFrom(
                        backgroundColor: Colors.orange
                      ) ,
                      onPressed: (){
                        print("Beğenildi");
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi/8,
                    child: TextButton(
                      child: Yazi("Yorum Yap",ekranGenisligi/25),
                      style:TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange
                      ) ,
                      onPressed: (){
                        print("Yorum Yapıldı");
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi/100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mantı",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: ekranGenisligi/20,
                    ),
                  ),
                  Row(
                    children: [
                      Yazi("Ocak Üzerinde Pişirilir", ekranGenisligi/25),
                      Spacer(),
                      Yazi("11 Temmuz", ekranGenisligi/25),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi/100),
              child: Yazi("Sıcak suyu ekleyip kaynamaya bırakalım. Kaynayan suya mantıları ekleyip karıştıralım. "
                  "Ara ara karıştırarak orta ateşte pişmeye bırakalım. Mantıların büyüklüğüne göre veya donmuş olup olmamasına göre pişme süresi "
                  "biraz değişir ama yaklaşık 20 dk mantılar şişip yumuşayıncaya kadar pişirelim.", ekranGenisligi/25),
            ),

          ],
        ),
      )

    );
  }
}

class Yazi extends StatelessWidget {
  String icerik;
  double yaziBoyut;

  Yazi(this.icerik, this.yaziBoyut);


  @override
  Widget build(BuildContext context) {
    return Text(icerik,style: TextStyle(fontSize: yaziBoyut),);
  }
}

