import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Color(0xFF202F41),
      body: Container(
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
              'Clock',
              style: TextStyle(color: Colors.white, fontSize: 64),
            ),
            Text(
              'Clock',
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
                  'IST',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
