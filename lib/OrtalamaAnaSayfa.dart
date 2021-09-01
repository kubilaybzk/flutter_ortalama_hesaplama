import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesaplama/Liste_Modeli/ders.dart';
import 'package:flutter_ortalama_hesaplama/ders_listesi.dart';
import 'package:flutter_ortalama_hesaplama/hard_degeri.dart';
import 'package:flutter_ortalama_hesaplama/kredi_degeri.dart';
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
double buildKredilerSecilen = 1.0;
double secilen = 1;
double buildHarflerSecilen = 4.0;
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
            Expanded(child: DerslerinListesi(onDeletedLesson: (index) {
              DataHelper.EklenenDersler.removeAt(index);
              print("Elemen cikti $index");
              setState(() {});
            })),
          ],
        ));
  }

  Widget _ilkSatir() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 2))),
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
    );
  }

  Widget _buildForm() {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: _buildTextForm(),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: HarfDegeri(onHarfDegeri: (gelen_harf_index) {
                      buildHarflerSecilen = gelen_harf_index;
                    }),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Kredi_Degeri_Widget(
                          onKrediDegeri: (gelen_kredi_degeri) {
                        buildKredilerSecilen = gelen_kredi_degeri;
                      })),
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
