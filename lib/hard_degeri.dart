import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesaplama/Constant/sabit.dart';
import 'package:flutter_ortalama_hesaplama/OrtalamaAnaSayfa.dart';

import 'data_creater.dart';

class HarfDegeri extends StatefulWidget {
  double buildHarflerSecilen = 4.0;
  final Function onHarfDegeri;
  HarfDegeri({required this.onHarfDegeri, Key? key}) : super(key: key);

  @override
  _HarfDegeriState createState() => _HarfDegeriState();
}

class _HarfDegeriState extends State<HarfDegeri> {
  @override
  Widget build(BuildContext context) {
    /*

  Normal Şartlarda  DropdownButton özelleştirilmesi biraz zor olabilir.
  Bunun için Container ile bunu sarmalayalım.

    */
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Sabit.Material_color.shade100.withOpacity(0.4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: DropdownButton<double>(
          items: DataHelper.tumDersHarfleri(),
          underline: Container(),
          onChanged: (dd) {
            setState(() {
              buildHarflerSecilen = dd!;
              print(buildHarflerSecilen);
              widget.onHarfDegeri(buildHarflerSecilen);
            });
          },
          value: buildHarflerSecilen,
        ),
      ),
    );
  }
}
