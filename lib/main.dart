import 'dart:js';

import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/services/choose_location.dart';
import 'package:world_time/pages/loding.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/":(context)=>Loding(),
      "/home":(context)=>Home(),
      "/choose_location":(context)=>Choose_location()
    },
  ));
}
