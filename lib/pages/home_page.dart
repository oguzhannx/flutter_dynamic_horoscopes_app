import 'package:flutter/material.dart';
import 'package:flutter_dynamic_horoscopes_app/globals/burclar_global.dart';
import 'package:flutter_dynamic_horoscopes_app/pages/burc_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }

  Container Body() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/main-page-background.jpg"),
            fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          Appbar(),
          SizedBox(height: 20),
          ustButonlar(),
          SizedBox(height: 20),
          BurclarButon(),
        ],
      ),
    );
  }

  Expanded BurclarButon() {
    var burclar = Burclar.butunBurclar();

    return Expanded(
        child: GridView.builder(
      itemCount: burclar.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 100,
      ),
      itemBuilder: (context, index) {
        return anasayfaBurcButon(burclar.values.toList()[index],
            burclar.keys.toList()[index], context);
      },
    ));
  }

  AppBar Appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: const Color.fromRGBO(59, 55, 188, 1),
      elevation: 4,
      title: const Center(
        child: Text(
          "BURÇ UYGULAMASI",
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Row ustButonlar() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Anlamsız "),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(59, 55, 188, 1),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Anlamsız "),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(59, 55, 188, 1),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Anlamsız "),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(59, 55, 188, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ElevatedButton anasayfaBurcButon(
      String burcAdi, String burcAdiKey, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return BurcDetay(
              burcAdi: burcAdi,
              burcAdiEn: burcAdiKey,
            );
          },
        ));
      },
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        disabledBackgroundColor: Colors.transparent,
        disabledForegroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: CircleBorder(),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/button-images/${burcAdiKey.toLowerCase()}.png",
            height: 70,
            color: Color.fromRGBO(212, 211, 235, 1),
          ),
          SizedBox(height: 5),
          Text("${burcAdi.toUpperCase()}"),
        ],
      ),
    );
  }
}
