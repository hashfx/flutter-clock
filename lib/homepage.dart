import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clock_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timeZoneString = now.timeZoneOffset.toString().split('.').first;
    // timeZoneOffset is returned either -ve or +ve
    var offsetSign = '';
    // if timeZone not starts with -, make it +
    if (!timeZoneString.startsWith('-')) offsetSign = '+';

    print(timeZoneString);

    return Scaffold(
      backgroundColor: Color(0xFF202F41),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    FlutterLogo(),
                    Text(
                      'Clock',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Clock',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(height: 32),
                Text(
                  formattedTime,
                  style: TextStyle(color: Colors.white, fontSize: 64),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                ClockView(),
                Text(
                  'Time Zone',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'UTC ' + offsetSign + timeZoneString,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
