import 'package:flutter/material.dart';
import 'package:flutter_dynamic_horoscopes_app/globals/burclar_global.dart';
import 'package:flutter_dynamic_horoscopes_app/widgets/bottom_navigation_bar_widget.dart';

class BurcDetay extends StatelessWidget {
  const BurcDetay({super.key});

  @override
  Widget build(BuildContext context) {
    print(Burclar.butunBurclar().length);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: body(context),
        bottomNavigationBar: BottomNavigation());
  }

  Column body(BuildContext context) {
    return Column(
      children: [
        bodyStack(context),
        SizedBox(
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

  Stack bodyStack(BuildContext context) {
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
          child: Container(
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
            child: getOzellikler(),
          ),
        ),
        Positioned(
          bottom: 300,
          right: 20,
          child: Image.asset(
            "assets/images/001-virgo.png",
            height: 125,
            width: 125,
            color: Color.fromRGBO(255, 123, 92, 1),
            fit: BoxFit.contain,
          ),
        ),
        const Positioned(
          top: 60,
          left: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kova Burcu",
                style: TextStyle(
                  color: Color.fromRGBO(212, 211, 235, 1),
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "Ekim - Kasım",
                style: TextStyle(
                  color: Color.fromRGBO(212, 211, 235, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
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

  getOzellikler() {
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
                child: burcOzellikleri("Grup:", "Su, dişi, negatif, sabit")),
            Expanded(
                child: burcOzellikleri("Yönetici Gezegeni:", "Mars ve Plüton")),
            Expanded(child: burcOzellikleri("Renk:", "Siyah, Canlı kırmızı")),
            Expanded(child: burcOzellikleri("Uğurlu Taş:", "Opal ve lal")),
            Expanded(child: burcOzellikleri("Şanslı Günü:", "Salı")),
            Expanded(child: burcOzellikleri("Karşıt Burcu:", "Boğa")),
            Expanded(child: burcOzellikleri("Metal:", "Çelik ve demir")),
            Expanded(
              child: burcOzellikleri(
                  "Çiçekler:", "Kırmızı gül, kırmızı karanfil ve ateş çiçeği"),
            ),
            Expanded(
                child: burcOzellikleri("Ağaçlar:", "Selvi, ardıç ve karaçam ")),
          ],
        ),
      ),
    );
  }

  Row burcOzellikleri(String title, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          content,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
