import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time="";
  String flag;
  String url;
  late bool isDaytime;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{
    try {
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      // print(response.body);
      Map data = jsonDecode(response.body);
      // print(data);
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(0, 3);
      String offset2 = data['utc_offset'].substring(4, 6);
      // print(datetime);
      // print(offset);
      // print(data['timezone']);
      DateTime obj = DateTime.parse(datetime);
      obj = obj.add(
          Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));
      // print(obj);
      isDaytime=obj.hour> 5  && obj.hour<18 ?true:false;
      time = DateFormat.jm().format(obj);
    }
    catch(e){
      print("error occured :$e");
      time="Time not available";
    }
  }
}
