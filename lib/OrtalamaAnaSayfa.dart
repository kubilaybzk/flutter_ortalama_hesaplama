import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesaplama/Liste_Modeli/ders.dart';
import 'package:flutter_ortalama_hesaplama/ders_listesi.dart';
import 'data/harf_detasi.dart';
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
String Kullanicinin_girdigi_ders = "";

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
            Expanded(child: DerslerinListesi()),
          ],
        ));
  }

  Widget _ilkSatir() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          decoration:
              BoxDecoration(border: Border(bottom: BorderSide(width: 2))),
          child: Row(
            children: [
              Expanded(
                child: _buildForm(),
                flex: 2,
              ),
              Expanded(
                child: Container(
                  child: OrtalamaBilgileri(
                      ortalama: DataHelper.ortalamHesapla(),
                      derssayisi: DataHelper.EklenenDersler.length),
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
                    onPressed: _dersOrtalamaHesaplama,
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
      onSaved: (k_girdigi) {
        setState(() {
          Kullanicinin_girdigi_ders = k_girdigi!;
        });
      },
      validator: (k_girdi) {
        if (k_girdi!.length <= 0) {
          return "Ders Adını Yazın";
        } else {
          return null;
        }
      },
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

  void _dersOrtalamaHesaplama() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var EklenenDers = Ders(
          Kullanicinin_girdigi_ders, buildKredilerSecilen, buildHarflerSecilen);
      print(EklenenDers);
      DataHelper.ders_ekle(EklenenDers);
      print(DataHelper.EklenenDersler);
      print("Ortalama");
      print(DataHelper.ortalamHesapla());
      setState(() {});
    }
  }
}
