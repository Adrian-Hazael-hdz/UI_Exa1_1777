import 'package:flutter/material.dart';
import 'mispantallas/Inicio.dart';
import 'mispantallas/pantalla2.dart';
import 'mispantallas/pantalla3.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'PChop App',
    initialRoute: '/',
    routes: {
      '/': (context) => Inicio(),
      '/productos': (context) => Pantalla2(),
      '/detalle': (context) => Pantalla3(),
    },
  ));
}