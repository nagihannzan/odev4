import 'package:flutter/material.dart';
import 'package:mobil_odev4/urunler.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Urunler>> urunYukle() async {
    var urunListesi = <Urunler>[];
    var u1 = Urunler(id: 1, marka: "L'Oreal", seri: "Glow Paradise", no: "353", fiyat: 439.99);
    var u2 = Urunler(id: 2, marka: "Golden Rose", seri: "Glow Kiss", no: "04", fiyat: 279.99);
    var u3 = Urunler(id: 3, marka: "Kiko", seri: "Smart Fusion", no: "405", fiyat: 480.00);
    var u4 = Urunler(id: 4, marka: "Flormar", seri: "Sheer Up", no: "011", fiyat: 459.90);
    var u5 = Urunler(id: 5, marka: "M.A.C", seri: "Silky Matte", no: "Russian Red", fiyat: 899.00);
    urunListesi.add(u1);
    urunListesi.add(u2);
    urunListesi.add(u3);
    urunListesi.add(u4);
    urunListesi.add(u5);
    return urunListesi;
  }
  int? seciliUrunId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Text("Ruj", style: TextStyle(color: Colors.white, fontSize: 27),),
          backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<List<Urunler>>(
          future: urunYukle(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var urunListesi = snapshot.data;
              return Column(
                children: [
                  Container(height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: urunListesi!.length,
                        itemBuilder: (context, indeks){
                          var urun = urunListesi[indeks];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                seciliUrunId = urun.id;
                              });
                            },
                            child: Container(width: 80,
                              margin: EdgeInsets.all(8), padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: seciliUrunId == urun.id ? Colors.purple.shade200 : Colors.purple.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                ),
                              child: Center(
                                  child: Text(urun.marka, style: TextStyle(
                                      color: Colors.purple.shade600,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),)
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                  Expanded(
                      child: GridView.builder(
                          itemCount: urunListesi!.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                          itemBuilder: (context, indeks) {
                            var urun = urunListesi[indeks];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  seciliUrunId = urun.id;
                                });
                              },
                              child: Container(
                                width: 80,
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: seciliUrunId == urun.id
                                      ? Colors.purple.shade200
                                      : Colors.purple.shade50,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(urun.marka,
                                            style: TextStyle(
                                                color: Colors.purple.shade600,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),),
                                          Text(urun.seri,
                                            style: TextStyle(
                                                color: Colors.purple.shade600,
                                                fontSize: 18),),
                                          Text(urun.no, style: TextStyle(
                                              color: Colors.purple.shade600,
                                              fontSize: 18),),
                                          Text("${urun.fiyat} TL", style: TextStyle(
                                              color: Colors.purple.shade600,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ),
                              ),
                            );
                          }),
                      ),
                ],
              );
            }else{
              return Text("ERROR");
            }
          }
      ),
    );
  }
}
