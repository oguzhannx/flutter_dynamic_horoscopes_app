import 'package:html/parser.dart';
import 'package:http/http.dart';

class BurcApi {
  BurcApi._();
  static Future<List<String>> getGunlukBurcYorumu(String burcAdi) async {
    List<String> burcYorum = [];
    final response = await Client().get(Uri.parse(
        "https://www.hurriyet.com.tr/mahmure/astroloji/${burcAdi.toLowerCase()}-burcu/"));

    if (response.statusCode == 200) {
      var document = parse(response.body);

      print("${burcAdi.toUpperCase()} Burcu Günlük Yorum");
      var contentList = document
          .getElementsByClassName("horoscope-detail-tab-content")[0]
          .querySelectorAll("p");
      for (var element in contentList) {
        burcYorum.add(element.text);
        print(element.text);
      }
      return burcYorum;
    } else {
      throw Exception();
    }
  }

  static Future<List<String>> getHaftalikBurcYorumu(String burcAdi) async {
    List<String> burcYorum = [];

    final response = await Client().get(Uri.parse(
        "https://www.hurriyet.com.tr/mahmure/astroloji/${burcAdi}-burcu-haftalik-yorum/"));

    if (response.statusCode == 200) {
      var document = parse(response.body);

      print("${burcAdi.toUpperCase()} Burcu Haftalık Yorum");

      var length = document
          .getElementsByClassName("horoscope-detail-tab-content")[0]
          .querySelectorAll("p");

      for (var element in length) {
        burcYorum.add(element.text);
        print(element.text);
      }
      return burcYorum;
    } else {
      throw Exception();
    }
  }

  static Future<List<String>> getAylikBurcYorumu(String burcAdi) async {
    List<String> burcYorum = [];

    final response = await Client().get(Uri.parse(
        "https://www.hurriyet.com.tr/mahmure/astroloji/${burcAdi}-burcu-aylik-yorum/"));

    if (response.statusCode == 200) {
      var document = parse(response.body);

      print("${burcAdi.toUpperCase()} Burcu Aylık Yorum");

      var length = document
          .getElementsByClassName("horoscope-detail-tab-content")[0]
          .querySelectorAll("p");

      for (var element in length) {
        burcYorum.add(element.text);
        print(element.text);
      }
      return burcYorum;
    } else {
      throw Exception();
    }
  }

  static Future<List<String>> getYillikBurcYorumu(String burcAdi) async {
    List<String> burcYorum = [];

    final response = await Client().get(Uri.parse(
        "https://www.hurriyet.com.tr/mahmure/astroloji/${burcAdi}-burcu-yillik-yorum/"));

    if (response.statusCode == 200) {
      var document = parse(response.body);

      print("${burcAdi.toUpperCase()} Burcu Yıllık Yorum");

      var length = document
          .getElementsByClassName("horoscope-detail-tab-content")[0]
          .querySelectorAll("p");

      for (var element in length) {
        burcYorum.add(element.text);
        print(element.text);
      }
      return burcYorum;
    } else {
      throw Exception();
    }
  }

  static getBurcOzellikleri(String burcAdi) async {
    final response = await Client().get(Uri.parse(
        "https://www.hurriyet.com.tr/mahmure/astroloji/${burcAdi}-burcu-ozellikleri/"));

    if (response.statusCode == 200) {
      var document = parse(response.body);

      print("${burcAdi.toUpperCase()} Burcu Yıllık Yorum");

      var length = document
          .getElementsByClassName("horoscope-detail-tab-content")[0]
          .querySelectorAll("p");

      for (var element in length) {
        print(element.text);
      }
    } else {
      throw Exception();
    }
  }
}
