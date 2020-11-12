import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location; // location name for UI
  String time; // Time in that location
  String flag; // url to an asset flag icon
  String url; // location for api eg '/Europe/London'
  bool isDayTime; // Store time is day or night day = true

  WorldTime({
    this.location,
    this.flag,
    this.url,
  });

  // Future is a temporary place holder. because we use instance.time in setupWorldTime
  Future<void> getTime() async {
    try {
      // get data from the API using http get
      // response is a built in object in http pakage
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //add data into strings
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // create date time object
      DateTime now = DateTime.parse(datetime);
      // add offset hour to date time to take the actual time
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Unable to get Time.';
    }
  }
}
