import 'package:flutter/material.dart';
import 'package:flutter_clock/app/data/data.dart';
import 'package:flutter_clock/app/data/theme_data.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Alarm',
            style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700,
              color: CustomColors.primaryTextColor,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: ListView(
              children: alarms.map((alarm) {
                return Container(
                  color: Colors.red,
                  height: 100,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
