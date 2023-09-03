import 'package:flutter/material.dart';
import 'package:flutter_dynamic_horoscopes_app/pages/burc_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main-page-background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            stackWidget(context),
          ],
        ),
      ),
    );
  }

// "assets/images/zodiac-circle.png"

  Stack stackWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/zodiac-circle.png"),
              scale: 0.2,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: (MediaQuery.of(context).size.height / 2) - 130,
          left: (MediaQuery.of(context).size.width / 2) - 160,
          child: Container(
            child: _getBurclar(context),
          ),
        ),
        Positioned(
          top: 100,
          left: 100,
          child: Container(
            child: Text(
              "Burç Yorumları",
              style: TextStyle(
                  fontSize: 34,
                  color: Color.fromRGBO(212, 211, 235, 1),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  _getBurclar(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            anasayfaBurcButon("capricorn", context),
            anasayfaBurcButon("aries", context),
            anasayfaBurcButon("libra", context),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            anasayfaBurcButon("capricorn", context),
            anasayfaBurcButon("aries", context),
            anasayfaBurcButon("libra", context),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            anasayfaBurcButon("capricorn", context),
            anasayfaBurcButon("aries", context),
            anasayfaBurcButon("libra", context),
          ],
        ),
      ],
    );
  }

  ElevatedButton anasayfaBurcButon(String burcAdi, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BurcDetay(),
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
            "assets/images/button-images/${burcAdi.toLowerCase()}.png",
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
