// ignore_for_file: public_member_api_docs, sort_constructors_first
class BurcOzellikleri {
  final String? Grup;
  final bool? Oncu;
  final bool? Pozitif;
  final String? YoneticiGezegen;
  final String? Renk;
  final String? UgurluTas;
  final int? SansliSayi;
  final String? SansliGun;
  final String? KarsitBurc;
  final String? Sehirler;
  final String? Metal;
  final String? Cicekler;
  final String? Agaclar;
  final String? Aralik;

  BurcOzellikleri(
      {required this.Grup,
      required this.Oncu,
      required this.Pozitif,
      required this.YoneticiGezegen,
      required this.Renk,
      required this.UgurluTas,
      required this.SansliSayi,
      required this.SansliGun,
      required this.KarsitBurc,
      required this.Sehirler,
      required this.Metal,
      required this.Cicekler,
      required this.Agaclar,
      required this.Aralik});

  @override
  String toString() {
    return 'BurcOzellikleri(Grup: $Grup, Oncu: $Oncu, Pozitif: $Pozitif, YoneticiGezegen: $YoneticiGezegen, Renk: $Renk, UgurluTas: $UgurluTas, SansliSayi: $SansliSayi, SansliGun: $SansliGun, KarsitBurc: $KarsitBurc, Sehirler: $Sehirler, Metal: $Metal, Cicekler: $Cicekler, Agaclar: $Agaclar)';
  }
}
