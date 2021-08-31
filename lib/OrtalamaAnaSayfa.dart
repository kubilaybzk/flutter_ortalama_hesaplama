import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesaplama/data_creater.dart';
import 'package:flutter_ortalama_hesaplama/ortalama_goster.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ortalama_hesaplama/Constant/sabit.dart';

class OrtalamaAnaSayfa extends StatefulWidget {
  OrtalamaAnaSayfa({Key? key}) : super(key: key);

  @override
  _OrtalamaAnaSayfaState createState() => _OrtalamaAnaSayfaState();
}

var formKey = GlobalKey<FormState>();
double secilen = 1;
double buildHarflerSecilen = 4.0;
double buildKredilerSecilen = 1.0;

class _OrtalamaAnaSayfaState extends State<OrtalamaAnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              Sabit.AppBar_Yazi,
              style: Sabit.baslikStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _ilkSatir(),
            SizedBox(
              height: 2,
            ),
            Container(
              height: 400,
              width: 400,
              color: Colors.red,
            ),
          ],
        ));
  }

  Widget _ilkSatir() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(width: 8.0, color: Color(0xFFDFDFDF)),
            left: BorderSide(width: 8.0, color: Color(0xFFDFDFDF)),
            right: BorderSide(width: 8.0, color: Color(0xFF7F7F7F)),
            bottom: BorderSide(width: 8.0, color: Color(0xFF7F7F7F)),
          )),
          child: Row(
            children: [
              Expanded(
                child: _buildForm(),
                flex: 2,
              ),
              Expanded(
                child: Container(
                  child: OrtalamaBilgileri(ortalama: 0, derssayisi: 1),
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: _buildTextForm(),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: _buildHarfler(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: _buildKrediler(),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 24,
                    ))
              ],
            )
          ],
        ));
  }

  Widget _buildTextForm() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Sabit.Material_color.shade100.withOpacity(0.2),
        hintText: Sabit.TextFormField_text,
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(borderRadius: Sabit.border_style),
      ),
    );
  }

  Widget _buildHarfler() {
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
            });
          },
          value: buildHarflerSecilen,
        ),
      ),
    );
  }

  Widget _buildKrediler() {
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
            });
          },
          value: buildKredilerSecilen,
        ),
      ),
    );
  }
}
