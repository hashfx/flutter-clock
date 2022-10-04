import 'package:flutter/material.dart';
import 'package:flutter_clock/views/clock_view.dart';
import 'package:flutter_clock/views/homepage.dart';
import 'package:flutter_clock/app/data/enums.dart';
import 'package:flutter_clock/menu_info.dart';
import 'package:flutter_clock/views/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: ((context) => MenuInfo(MenuType.clock, title: 'Clock', imageSource: 'assets/')),
        child: HomePage(),
      ),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center, // fills entire space
        color: Color(0xFF202F41),
        child: ClockView(size: 100,),
      ),
    );
  }
}
*/
