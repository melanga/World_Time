import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color textcolor = data['isDayTime'] ? Colors.black : Colors.white;
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(
                  Icons.edit_location,
                  color: textcolor,
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(color: textcolor),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: textcolor,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  color: textcolor,
                  fontSize: 66.0,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
