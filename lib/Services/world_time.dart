import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;

  late bool isDaytime;
  WorldTime(this.location,this.flag,this.url);

  Future<void> getTime() async{
    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String hour = data['utc_offset'].substring(0,3);
      String mins = data['utc_offset'].substring(4,6);
      print("Hour = $hour and mins = $mins");

      DateTime now = DateTime.parse(datetime);
      print("Now = $now");

      now = now.add(Duration(hours: int.parse(hour)));
      now = now.add(Duration(minutes: int.parse(mins)));

      isDaytime = now.hour >6 && now.hour<19 ? true : false;
      time = DateFormat.jm().format(now);
      print("Time is = $time");
    }
    catch(e){
      print("Error: $e");
      time = "could not be processed!";
    }
  }

}