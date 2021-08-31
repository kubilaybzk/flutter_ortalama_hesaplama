import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesaplama/OrtalamaAnaSayfa.dart';
import 'Constant/sabit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Sabit.MaterialTitle,
      theme: ThemeData(
        accentColor: Sabit.Material_color,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OrtalamaAnaSayfa(),
    );
  }
}
