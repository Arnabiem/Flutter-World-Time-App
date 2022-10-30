import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time_app/services/world_time.dart';
class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}
int count=0;
class _LocationState extends State<Location> {
  List<WorldTime> locations=[
  WorldTime(location: "London",flag: "London.png",url: "Europe/london"),
  WorldTime(location: "New York",flag: "New_York.png",url: "America/New_York"),
  WorldTime(location: "Seoul",flag: "seoul.png",url: "Asia/Seoul"),
  WorldTime(location: "Jakarta",flag: "jakarta.png",url: "Asia/Jakarta"),
  WorldTime(location: "Nairobi",flag: "nairobi.png",url: "Africa/Nairobi"),
    WorldTime(location: "Qatar",flag: "qatar.png",url: "Asia/Qatar"),
    WorldTime(location: "Sydney",flag: "austrailia.png",url: "Australia/Sydney"),
    WorldTime(location: "Madrid",flag: "spain.png",url: "Europe/Madrid"),
    WorldTime(location: "Melbourne",flag: "austrailia.png",url: "Australia/Melbourne"),
    WorldTime(location: "Perth",flag: "austrailia.png",url: "Australia/Perth"),
    WorldTime(location: "Brisbane",flag: "austrailia.png",url: "Australia/Brisbane"),
    WorldTime(location: "Adelaide",flag: "austrailia.png",url: "Australia/Adelaide"),
    WorldTime(location: "Hobart",flag: "austrailia.png",url: "Australia/Hobart"),





  ];
  void updateTime(index) async{
    WorldTime obj=locations[index];
    await obj.getTime();
    Navigator.pop(context,{
      'location':obj.location,
      'flag':obj.flag,
      'time':obj.time,
      'isDaytime':obj.isDaytime,
    });
  }
  @override
  Widget build(BuildContext context) {
    // print("build function used");
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
    appBar: AppBar(
      title: Text('Choose a Location'),
      centerTitle: true,
      backgroundColor:Colors.indigoAccent ,
    ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                      locations[index].location
                  ),

                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
