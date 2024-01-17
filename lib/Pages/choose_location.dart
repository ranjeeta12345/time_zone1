import 'package:flutter/material.dart';
import 'package:time_zone1/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime('London', 'UK.png', 'Europe/London'),
    WorldTime('Berlin', 'Berlin.png', 'Europe/Berlin'),
    WorldTime('Colombo', 'srilanka.png', 'Asia/Colombo'),
    WorldTime('Kolkata', 'India.jpeg', 'Asia/Kolkata'),
    WorldTime('New_York', 'america.png', 'America/New_York'),
    WorldTime('Chicago', 'canada.png', 'America/Chicago'),
    WorldTime('Cairo', 'Alexandria.png', 'Africa/Cairo'),
    WorldTime('Nairobi', 'ghana.png', 'Africa/Nairobi'),
  ];
  void UpdateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[400],
        appBar: AppBar(
          title: Text(
            "Choose Location",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          backgroundColor: Colors.indigo,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                child: ListTile(
                  onTap: (){
                    UpdateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    //  backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
                    backgroundImage: AssetImage("Images/${locations[index].flag}"),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
