import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_dynamic_horoscopes_app/models/burc_ozellikleri_model.dart';

class Burclar {
  Burclar._();
  static Future<BurcOzellikleri> jsonBurcOzellikleri(String burcAdi) async {
    // JSON dosyasını okumak için root dizinini kullanın
    final String jsonContent =
        await rootBundle.loadString('assets/data/burc_ozellikleri.json');

    // JSON içeriğini bir Dart Map nesnesine çevirin
    final Map<String, dynamic> jsonData = json.decode(jsonContent);
    var data = jsonData[burcAdi];

    var burcOzellikleri = BurcOzellikleri(
        Grup: data["Grup"],
        Oncu: data["Öncü"],
        Pozitif: data["Pozitif"],
        YoneticiGezegen: data["Yönetici Gezegen"],
        Renk: data["Renk"],
        UgurluTas: data["Uğurlu Taş"]
            .toString()
            .replaceAll("[", "")
            .replaceAll("]", ""),
        SansliSayi: data["Şanslı Sayı"],
        SansliGun: data["Şanslı Gün"],
        KarsitBurc: data["Karşıt Burç"],
        Sehirler:
            data["Şehirler"].toString().replaceAll("[", "").replaceAll("]", ""),
        Metal: data["Metal"],
        Cicekler:
            data["Çiçekler"].toString().replaceAll("[", "").replaceAll("]", ""),
        Agaclar:
            data["Ağaçlar"].toString().replaceAll("[", "").replaceAll("]", ""),
        Aralik: data["Aralik"].toString());

    return burcOzellikleri;
  }

  static Map<String, String> butunBurclar() {
    Map<String, String> burclar = {
      "Aries": "Koç",
      "Taurus": "Boğa",
      "Gemini": "İkizler",
      "Cancer": "Yengeç",
      "Leo": "Aslan",
      "Virgo": "Başak",
      "Libra": "Terazi",
      "Scorpio": "Akrep",
      "Sagittarius": "Yay",
      "Capricorn": "Oğlak",
      "Aquarius": "Kova",
      "Pisces": "Balık"
    };
    return burclar;
  }

  static String turkishToEnglish(String input) {
    final Map<String, String> turkishToEnglishMap = {
      'ç': 'c',
      'ğ': 'g',
      'ı': 'i',
      'ö': 'o',
      'ş': 's',
      'ü': 'u',
      'Ç': 'C',
      'Ğ': 'G',
      'İ': 'I',
      'Ö': 'O',
      'Ş': 'S',
      'Ü': 'U'
    };

    String result = '';
    for (int i = 0; i < input.length; i++) {
      final char = input[i];
      final replacement = turkishToEnglishMap[char];
      result += replacement ?? char;
    }

    return result;
  }
}
