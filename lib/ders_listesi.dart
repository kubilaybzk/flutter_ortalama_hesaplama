import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesaplama/Constant/sabit.dart';
import 'package:flutter_ortalama_hesaplama/Liste_Modeli/ders.dart';
import 'package:flutter_ortalama_hesaplama/data/harf_detasi.dart';

class DerslerinListesi extends StatelessWidget {
  final Function onDeletedLesson;
  const DerslerinListesi({required this.onDeletedLesson, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.EklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: DataHelper.EklenenDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (e) {
                  onDeletedLesson(index);
                },
                child: Card(
                  child: ListTile(
                    title: Text(tumDersler[index].ders_ismi),
                    leading: CircleAvatar(
                      backgroundColor: Sabit.Material_color,
                      child: Text((tumDersler[index].ders_kredi *
                              tumDersler[index].harf_notu)
                          .toStringAsFixed(1)),
                    ),
                    subtitle: Text(
                        "Kredi Değeri : ${tumDersler[index].ders_kredi}  Hard Değeri :${tumDersler[index].harf_notu} "),
                  ),
                ),
              );
            })
        : Center(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Ders Ekleyin",
                style: TextStyle(
                    fontSize: 48,
                    color: Sabit.Material_color,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
  }
}
