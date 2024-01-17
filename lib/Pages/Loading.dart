import 'package:flutter/material.dart';
import 'package:time_zone1/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void setupWorldTime() async{
    WorldTime instance = WorldTime("Kolkata", "India.jpeg", "Asia/Kolkata");
    await instance.getTime();

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }
}
