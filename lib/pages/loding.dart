import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'services/world_time.dart';

class Loding extends StatefulWidget {
  const Loding({Key? key}) : super(key: key);

  @override
  State<Loding> createState() => _LodingState();
}

class _LodingState extends State<Loding> {


  Future<void> setUpWordTime() async {
    WorldTime instence=WorldTime(location: "Paris", flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Flag_of_France_%281958%E2%80%931976%29.svg/1200px-Flag_of_France_%281958%E2%80%931976%29.svg.png", url: "Europe/Berlin");
    await instence.getTime();
    print("${instence.time} - ${instence.location} - ${instence.flag}");
    Navigator.restorablePushReplacementNamed(context,"/home",arguments: {
      'location': instence.location,
      'flag': instence.flag,
      'time':instence.time,
      "isDay":instence.isDay
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWordTime();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[850],

      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Loding",style: TextStyle(color: Colors.deepOrange[200],fontSize: 40),),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: SpinKitFoldingCube(
                color: Colors.deepOrange[200],
                size: 40.0,
              ),
            )
          ],
        )
        ),
    );

  }
}
