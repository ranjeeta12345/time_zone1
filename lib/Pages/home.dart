import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  // Map data = {
  //   'location' : "Kolkata",
  //   'flag' : "India.jpeg",
  //   'time' : "1:28",
  //   'isDaytime' : true,
  // };


  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    //data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
   //data=data;
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.cyan : Colors.blueGrey;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("Images/$bgImage"),
      fit: BoxFit.cover,
    )
    ),
      child: Padding(
    padding: EdgeInsets.only(top: 120),
    child: Column(
    children: [
    ElevatedButton.icon(
    onPressed: () async{
    dynamic result = await Navigator.pushNamed(context, '/location');
    setState(() {
    data = {
    'time' : result['time'],
    'location' : result['location'],
    'isDaytime' : result['isDaytime'],
    'flag' : result['flag'],
    };
    });
    },
        icon: Icon(Icons.edit_location),
        label: Text(
            "Edit location",
               style: TextStyle(color: Colors.white),
    )),
      SizedBox(height: 22,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              data['location'],
            style: TextStyle(
              fontSize: 28,
              letterSpacing: 1.5
            ),

          )
        ],
      ),
      SizedBox(height: 20,),
      Text(
        data['time'],
        style: TextStyle(
          fontSize: 65,
          color: Colors.white
        ),
      )
    ],
    ),
      ),
          ),
      ),
    );
  }
}
