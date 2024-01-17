import 'package:flutter/material.dart';
import 'package:time_zone1/Pages/choose_location.dart';
import 'package:time_zone1/Pages/Loading.dart';
import 'Pages/home.dart';
///test for github
void main() {
  runApp(MaterialApp(
    // home: ChooseLocation(),
    initialRoute: "/",
    routes: {
      "/" : (context) => loading(),
      "/home" : (context) => const Home(),
      "/location" : (context) => const ChooseLocation(),
    },
  ));
}