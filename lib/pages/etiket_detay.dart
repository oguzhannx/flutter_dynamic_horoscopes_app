// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_dynamic_horoscopes_app/api/burclar_api/burc_api.dart';
import 'package:flutter_dynamic_horoscopes_app/globals/burclar_global.dart';
import 'package:flutter_dynamic_horoscopes_app/helpers/ui_helper.dart';

class EtiketDetay extends StatelessWidget {
  String burcAdi;
  String etiket;
  EtiketDetay({
    Key? key,
    required this.burcAdi,
    required this.etiket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${burcAdi.toUpperCase()} $etiket",
          style: TextStyle(
            color: HelperUI.birincilRenk,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: HelperUI.birincilRenk,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: HelperUI.ikincilRenk,
      body: FutureBuilder(
        future: BurcApi.getEtiketAciklama(
          Burclar.turkishToEnglish(burcAdi.toLowerCase()),
          Burclar.turkishToEnglish(etiket.toLowerCase()).replaceAll(" ", "-"),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return aciklamalar(snapshot);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView aciklamalar(AsyncSnapshot<List<String>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                snapshot.data![index],
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        );
      },
    );
  }

  String etiketForUrl() {
    var urlEtiket =
        Burclar.turkishToEnglish(etiket.toLowerCase()).replaceAll(" ", "-");

    return "";
  }
}
