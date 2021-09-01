import 'package:flutter/material.dart';

class Ders {
  final String ders_ismi;
  final double ders_kredi;
  final double harf_notu;

  Ders(this.ders_ismi, this.ders_kredi, this.harf_notu);

  @override
  String toString() {
    // TODO: implement toString
    return "  $ders_ismi    ,     $ders_kredi,     $harf_notu  ";
  }
}
