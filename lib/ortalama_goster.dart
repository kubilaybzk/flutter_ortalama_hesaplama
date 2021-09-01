import 'package:flutter/material.dart';
import 'Constant/sabit.dart';

class OrtalamaBilgileri extends StatelessWidget {
  final double ortalama;
  final int derssayisi;

  const OrtalamaBilgileri(
      {required this.ortalama, required this.derssayisi, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(derssayisi > 0 ? "$derssayisi tane ders eklendi" : "Ders Ekleyin",
            style: Sabit.derssayisi_style),
        Text(ortalama >= 0 ? "${ortalama.toStringAsFixed(2)}" : "0",
            style: Sabit.ortalama_number),
        Text("Ortalamanız", style: Sabit.ortalama_goster_sabit)
      ],
    );
  }
}
