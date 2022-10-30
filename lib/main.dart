// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:world_time_app/multiscreens/loading.dart';
import 'package:world_time_app/multiscreens/location.dart';
import 'multiscreens/home.dart';
void main()=> runApp(MaterialApp(
  // home: Home(),
    debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes:{
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/location':(context)=> Location(),
    // '/loading':(context)=> Loading(),
  }

));