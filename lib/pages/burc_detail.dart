import 'package:flutter/material.dart';
import 'package:flutter_dynamic_horoscopes_app/api/burclar_api/burc_api.dart';

import 'package:flutter_dynamic_horoscopes_app/globals/burclar_global.dart';
import 'package:flutter_dynamic_horoscopes_app/models/burc_ozellikleri_model.dart';
import 'package:flutter_dynamic_horoscopes_app/pages/yorum_sayfasi.dart';
import 'package:flutter_dynamic_horoscopes_app/widgets/bottom_navigation_bar_widget.dart';

class BurcDetay extends StatefulWidget {
  final String burcAdi;
  final String burcAdiEn;
  BurcDetay({
    Key? key,
    required this.burcAdi,
    required this.burcAdiEn,
  }) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  var pageViewController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: PageView(
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          onPageChanged: (value) {
            debugPrint("gelen Index $value");
            index = value;
            setState(() {});
          },
          controller: pageViewController,
          children: sayfalar(context),
        ),
        bottomNavigationBar: BottomNavigation(
            pageController: pageViewController, currentIndex: index));
  }

  List<Widget> sayfalar(BuildContext context) {
    return [
      firstPage(context),
      YorumSayfasi(
        burc: Burclar.turkishToEnglish(widget.burcAdi).toLowerCase(),
        zaman: "Günlük",
        burcTR: widget.burcAdi,
      ),
      YorumSayfasi(
        burc: Burclar.turkishToEnglish(widget.burcAdi).toLowerCase(),
        zaman: "Aylık",
        burcTR: widget.burcAdi,
      ),
      YorumSayfasi(
        burc: Burclar.turkishToEnglish(widget.burcAdi).toLowerCase(),
        zaman: "Haftalık",
        burcTR: widget.burcAdi,
      ),
      YorumSayfasi(
        burc: Burclar.turkishToEnglish(widget.burcAdi).toLowerCase(),
        zaman: "Yıllık",
        burcTR: widget.burcAdi,
      ),
    ];
  }

  Column firstPage(BuildContext context) {
    return Column(
      children: [
        bodyStack(context, widget.burcAdi),
        const SizedBox(
          height: 10,
        ),
        etiketlerWidget()
      ],
    );
  }

  Padding etiketlerWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 30,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Etiketler: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Aşk"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(83, 80, 180, 1)),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(83, 80, 180, 1)),
                  child: Text("Meşk"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(83, 80, 180, 1)),
                  child: Text("Meşk"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(83, 80, 180, 1)),
                  child: Text("Meşk"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(83, 80, 180, 1)),
                  child: Text("Meşk"),
                ),
                SizedBox(width: 10),
              ],
            )
          ],
        ),
      ),
    );
  }

  Stack bodyStack(BuildContext context, String burcAdi) {
    return Stack(
      children: [
        Container(
          height: 550,
          color: Colors.transparent,
        ),
        Container(
          height: (MediaQuery.of(context).size.height / 2),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill),
            boxShadow: [
              BoxShadow(
                  offset: Offset(5, 10),
                  blurRadius: 20,
                  color: Color.fromRGBO(59, 55, 188, 1))
            ],
            color: Color.fromRGBO(59, 55, 188, 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(300),
              bottomRight: Radius.circular(100),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: (MediaQuery.of(context).size.width / 2) - 175,
          child: FutureBuilder(
            future: Burclar.jsonBurcOzellikleri(burcAdi),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.2, 0.2),
                        blurStyle: BlurStyle.normal,
                        blurRadius: 40,
                        color: Color.fromRGBO(212, 211, 235, 1),
                      )
                    ],
                  ),
                  width: 350,
                  height: 350,
                  child: getOzellikler(snapshot.data!),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.2, 0.2),
                        blurStyle: BlurStyle.normal,
                        blurRadius: 40,
                        color: Color.fromRGBO(212, 211, 235, 1),
                      )
                    ],
                  ),
                  width: 350,
                  height: 350,
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        Positioned(
          bottom: 300,
          right: 20,
          child: Image.asset(
            "assets/images/${widget.burcAdiEn.toLowerCase()}.png",
            height: 125,
            width: 125,
            color: Color.fromRGBO(255, 123, 92, 1),
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 60,
          left: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${burcAdi.toString()} Burcu",
                style: TextStyle(
                  color: Color.fromRGBO(212, 211, 235, 1),
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              FutureBuilder(
                future: Burclar.jsonBurcOzellikleri(burcAdi),
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data?.Aralik ?? "",
                    style: TextStyle(
                      color: Color.fromRGBO(212, 211, 235, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.left,
                  );
                },
              )
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: 10,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios,
                color: Color.fromRGBO(130, 129, 158, 1)),
          ),
        ),
      ],
    );
  }

  getOzellikler(BurcOzellikleri burcOzellik) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Özellikleri",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: burcOzellikleri("Grup:", burcOzellik.Grup.toString())),
            Expanded(
                child: burcOzellikleri("Yönetici Gezegeni:",
                    burcOzellik.YoneticiGezegen.toString())),
            Expanded(
                child: burcOzellikleri("Renk:", burcOzellik.Renk.toString())),
            Expanded(
                child: burcOzellikleri(
                    "Uğurlu Taş:", burcOzellik.UgurluTas.toString())),
            Expanded(
                child: burcOzellikleri(
                    "Şanslı Günü:", burcOzellik.SansliGun.toString())),
            Expanded(
                child: burcOzellikleri(
                    "Karşıt Burcu:", burcOzellik.KarsitBurc.toString())),
            Expanded(
                child: burcOzellikleri("Metal:", burcOzellik.Metal.toString())),
            Expanded(
              child:
                  burcOzellikleri("Çiçekler:", burcOzellik.Cicekler.toString()),
            ),
            Expanded(
                child: burcOzellikleri(
                    "Ağaçlar:", burcOzellik.Agaclar.toString())),
          ],
        ),
      ),
    );
  }

  Row burcOzellikleri(String title, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          child: Text(
            content,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            maxLines: 3,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
