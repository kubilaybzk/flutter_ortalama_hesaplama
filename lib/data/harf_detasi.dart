import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesaplama/Liste_Modeli/ders.dart';

class DataHelper {
  static List<String> _createDersHarfNotlari() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumDersHarfleri() {
    return _createDersHarfNotlari()
        .map((e) => DropdownMenuItem<double>(
              child: Text(e),
              value: _harfiNotaCevir(e),
            ))
        .toList();
  }
  /*
Üstte olan fonksiyonda amacımız ;
            DropdownMenuItem(child: Text("AA"), value: 4.0),
            DropdownMenuItem(child: Text("BA"), value: 3.5),
            DropdownMenuItem(child: Text("CC"), value: 3.0),
            DropdownMenuItem(child: Text("DC"), value: 2.5),

  Değerlerini oluşturma.
  
 */

  static List<DropdownMenuItem<double>> tumKrediler() {
    return List.generate(10, (index) => (index + 1))
        .toList()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }

  static List<Ders> EklenenDersler = [];

  static ders_ekle(Ders gelen) {
    EklenenDersler.add(gelen);
  }

  static double ortalamHesapla() {
    double ToplamNot = 0;
    double ToplamKredi = 0;
    EklenenDersler.forEach((element) {
      ToplamNot = ToplamKredi + (element.harf_notu * element.ders_kredi);
      ToplamKredi = element.ders_kredi;
    });
    return ToplamNot / ToplamKredi;
  }
}
