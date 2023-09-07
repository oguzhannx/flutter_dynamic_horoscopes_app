// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_horoscopes_app/api/burclar_api/burc_api.dart';
import 'package:flutter_dynamic_horoscopes_app/helpers/ui_helper.dart';

class YorumSayfasi extends StatelessWidget {
  String burc;
  String burcTR;
  String zaman;
  YorumSayfasi({
    Key? key,
    required this.burc,
    required this.zaman,
    required this.burcTR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "$burcTR $zaman Tahmini",
            style: TextStyle(
                color: HelperUI.birincilRenk,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: getFuture(),
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
      backgroundColor: HelperUI.ikincilRenk,
    );
  }

  ListView aciklamalar(AsyncSnapshot<List<String>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                snapshot.data![index],
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<List<String>> getFuture() {
    switch (zaman) {
      case "Günlük":
        return BurcApi.getGunlukBurcYorumu(burc);
      case "Haftalık":
        return BurcApi.getHaftalikBurcYorumu(burc);
      case "Aylık":
        return BurcApi.getAylikBurcYorumu(burc);

      case "Yıllık":
        return BurcApi.getYillikBurcYorumu(burc);

      default:
        return Future.error(Error);
    }
  }
}
