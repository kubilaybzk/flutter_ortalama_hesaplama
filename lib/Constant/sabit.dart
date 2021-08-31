import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabit {
  static const MaterialTitle = "Burası Material Title";
  static const Material_color = Colors.indigo;
  static const AppBar_Yazi = "Ortalama Hesapla";
  static const TextFormField_text = "Dersin Adını girin.";

  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 30, fontWeight: FontWeight.w900, color: Colors.red);

  static BorderRadius border_style = BorderRadius.circular(24);

  static final TextStyle derssayisi_style = GoogleFonts.quicksand(
      fontSize: 14, fontWeight: FontWeight.w900, color: Material_color);

  static final TextStyle ortalama_number = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w900, color: Material_color);

  static final TextStyle ortalama_goster_sabit = GoogleFonts.quicksand(
      fontSize: 12, fontWeight: FontWeight.w900, color: Material_color);
}
