import 'package:html/parser.dart';
import 'package:http/http.dart';

class BurcApi {
  BurcApi._();
  static Future<List<String>> getGunlukBurcYorumu(String burcAdi) async {
    List<String> burcYorum = [];

    try {
      final response = await Client().get(Uri.parse(
          "https://www.hurriyet.com.tr/mahmure/astroloji/${burcAdi.toLowerCase()}-burcu/"));
      if (response.statusCode == 200) {
        var document = parse(response.body);

        //print("${burcAdi.toUpperCase()} Burcu Günlük Yorum");
        var contentList = document
            .getElementsByClassName("horoscope-detail-tab-content")[0]
            .querySelectorAll("p");
        for (var element in contentList) {
          burcYorum.add(element.text);
          //print(element.text);
        }
        return burcYorum;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
    }
    return burcYorum;
  }

  static Future<List<String>> getHaftalikBurcYorumu(String burcAdi) async {
    List<String> burcYorum = [];

    try {
      final response = await Client().get(Uri.parse(
          "https://www.hurriyet.com.tr/mahmure/astroloji/${burcAdi}-burcu-haftalik-yorum/"));

      if (response.statusCode == 200) {
        var document = parse(response.body);

        //print("${burcAdi.toUpperCase()} Burcu Haftalık Yorum");

        var length = document
            .getElementsByClassName("horoscope-detail-tab-content")[0]
            .querySelectorAll("p");

        for (var element in length) {
          burcYorum.add(element.text);
          //print(element.text);
        }
        return burcYorum;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
    }
    return burcYorum;
  }

  static Future<List<String>> getAylikBurcYorumu(String burcAdi) async {
    List<String> burcYorum = [];
    try {
      final response = await Client().get(Uri.parse(
          "https://www.hurriyet.com.tr/mahmure/astroloji/${burcAdi}-burcu-aylik-yorum/"));

      if (response.statusCode == 200) {
        var document = parse(response.body);

        //print("${burcAdi.toUpperCase()} Burcu Aylık Yorum");

        var length = document
            .getElementsByClassName("horoscope-detail-tab-content")[0]
            .querySelectorAll("p");

        for (var element in length) {
          burcYorum.add(element.text);
          //print(element.text);
        }
        return burcYorum;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
    }
    return burcYorum;
  }

  static Future<List<String>> getYillikBurcYorumu(String burcAdi) async {
    List<String> burcYorum = [];

    try {
      final response = await Client().get(Uri.parse(
          "https://www.hurriyet.com.tr/mahmure/astroloji/${burcAdi}-burcu-yillik-yorum/"));

      if (response.statusCode == 200) {
        var document = parse(response.body);

        //print("${burcAdi.toUpperCase()} Burcu Yıllık Yorum");

        var length = document
            .getElementsByClassName("horoscope-detail-tab-content")[0]
            .querySelectorAll("p");

        for (var element in length) {
          burcYorum.add(element.text);
          //print(element.text);
        }
        return burcYorum;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
    }
    return burcYorum;
  }

  static getBurcOzellikleri(String burcAdi) async {
    try {
      final response = await Client().get(Uri.parse(
          "https://www.hurriyet.com.tr/mahmure/astroloji/${burcAdi}-burcu-ozellikleri/"));

      if (response.statusCode == 200) {
        var document = parse(response.body);

        //print("${burcAdi.toUpperCase()} Burcu Yıllık Yorum");

        var length = document
            .getElementsByClassName("horoscope-detail-tab-content")[0]
            .querySelectorAll("p");

        for (var element in length) {
          //print(element.text);
        }
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<String>> getBurcEtiketler(String burcAdi) async {
    List<String> etiketler = [];
    try {
      final response = await Client().get(Uri.parse(
          "https://www.hurriyet.com.tr/mahmure/astroloji/${burcAdi.toLowerCase()}-burcu/"));
      if (response.statusCode == 200) {
        var document = parse(response.body);

        //print("${burcAdi.toUpperCase()} Burcu Günlük Yorum");
        var contentList = document
            .getElementsByClassName("horoscope-detail-tags")[0]
            .querySelectorAll("a");
        for (var element in contentList) {
          etiketler.add(element.text);
          // print("element: ${element.text}");
        }
        etiketler.removeLast();
        return etiketler;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
    }
    return etiketler;
  }

  static Future<List<String>> getEtiketAciklama(
      String burcAdi, String etiketAdi) async {
    List<String> paragraf = [];
    try {
      final response = await Client().get(Uri.parse(
          "https://www.hurriyet.com.tr/mahmure/astroloji/burclar/${burcAdi.toLowerCase()}-burcu/${etiketAdi.toLowerCase()}"));
      if (response.statusCode == 200) {
        var document = parse(response.body);

        //print("${burcAdi.toUpperCase()} Burcu Günlük Yorum");
        var contentList = document
            .getElementsByClassName("rhd-all-article-detail")[0]
            .querySelectorAll("p");
        for (var element in contentList) {
          paragraf.add(element.text);
          // print("element: ${element.text}");
        }

        return paragraf;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
    }
    return paragraf;
  }
}
