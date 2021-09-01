import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesaplama/Constant/sabit.dart';

import 'data_creater.dart';

class Kredi_Degeri_Widget extends StatefulWidget {
  final Function onKrediDegeri;
  Kredi_Degeri_Widget({required this.onKrediDegeri, Key? key})
      : super(key: key);

  @override
  _Kredi_Degeri_WidgetState createState() => _Kredi_Degeri_WidgetState();
}

class _Kredi_Degeri_WidgetState extends State<Kredi_Degeri_Widget> {
  double buildKredilerSecilen = 1.0;
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
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<double>(
          items: DataHelper.tumKrediler(),
          underline: Container(),
          onChanged: (vv) {
            setState(() {
              buildKredilerSecilen = vv!;
              print(buildKredilerSecilen);
              widget.onKrediDegeri(buildKredilerSecilen);
            });
          },
          value: buildKredilerSecilen,
        ),
      ),
    );
  }
}
