import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class WorldTime{
  String location;
  String flag;
  String url;
  String time="0";
  bool isDay=false;
  WorldTime({required this.location ,required this.flag ,required this.url});
   Future <void >getTime() async {
     try{
       Uri url=Uri.parse("http://worldtimeapi.org/api/timezone/${this.url.toString()}");
       Response response= await get(url);
       Map data = jsonDecode(response.body);
       String dateTime=data['utc_datetime'];
       String offset=data['utc_offset'];
       String houres=offset.substring(1,3);
       String minutes=offset.substring(4,5);
       DateTime now=DateTime.parse(dateTime);
       now=now.add(Duration(hours:int.parse(houres),minutes: int.parse(minutes)));
       if (now.hour>6&&now.hour<20){
         isDay=true;
       }
       time=DateFormat.jm().format(now);
     }catch(e){
       print(e);
       time="error: $e";
     }
}

}