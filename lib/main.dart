import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dynamic_horoscopes_app/pages/burc_detail.dart';
import 'package:flutter_dynamic_horoscopes_app/pages/home_page.dart';

void main() {
  runApp(const HoroscopeApp());
}

class HoroscopeApp extends StatelessWidget {
  const HoroscopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Burc Yorum",
      home: HomePage(),
    );
  }
}
