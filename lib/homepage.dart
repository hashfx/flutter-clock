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
              buildMenuButton('Clock', 'clock_icon.png'),
              buildMenuButton('Alarm', 'alarm_icon.png'),
              buildMenuButton('Timer', 'timer_icon.png'),
              buildMenuButton('Stopwatch', 'stopwatch_icon.png'),
            ],
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 64,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'Clock',
                      style: TextStyle(
                          fontFamily: 'avenir',
                          color: Colors.white,
                          fontSize: 24),
                    ),
                  ),
                  
                  Text(
                    formattedTime,
                    style: TextStyle(
                        fontFamily: 'avenir',
                        color: Colors.white,
                        fontSize: 64),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                        fontFamily: 'avenir',
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  ClockView(),
                  Text(
                    'Time Zone',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        color: Colors.white,
                        fontSize: 24),
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
          ),
        ],
      ),
    );
  }

  Padding buildMenuButton(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
              scale: 1.5,
            ),
            SizedBox(height: 16),
            Text(
              title ?? '',
              style: TextStyle(
                  fontFamily: 'avenir', color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
