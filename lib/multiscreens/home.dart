import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data: ModalRoute.of(context)!.settings.arguments as Map;

    print(data);
    String bgImage=data['isDaytime']?'day.png':'night.png';
    Color? topColor=data['isDaytime']?Colors.indigo[300]:Colors.indigo[900];
    return Scaffold(
      backgroundColor: topColor,
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async{
                     dynamic result=await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data={
                         'time':result['time'],
                         'location':result['location'],
                         'flag':result['flag'],
                         'isDaytime':result['isDaytime']
                       };
                     });
                    },
                  icon: Icon(
                      Icons.edit_location,
                      color:Colors.green
                  ),
                    label: Text(
                        'Edit location',
                            style:TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                            )
                    ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.red
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        data['time'],
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.red
                      ),
                    )
                  ],
                )
              ],

            ),
          ),
        )

      ),
    );
  }
}
