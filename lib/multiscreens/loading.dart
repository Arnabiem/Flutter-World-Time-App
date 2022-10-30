import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
// String time="Loading.....pls wait.....";

  void setupTime() async {
  WorldTime wt=WorldTime(location: "Kolkata",flag: "India.jpg",url: "Asia/Kolkata");
  await wt.getTime();
  Navigator.pushReplacementNamed(context,'/home',arguments: {
    'location':wt.location,
     'flag':wt.flag,
     'time':wt.time,
     'isDaytime':wt.isDaytime,
  });
  // print(wt.time);
  // setState(() {
  //   time=wt.time;
  // });
}

  @override
  void initState() {
    super.initState();
    setupTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.indigo ,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),

    );
  }
}
