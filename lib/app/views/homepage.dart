import 'package:flutter/material.dart';
import 'package:flutter_clock/app/data/data.dart';
import 'package:flutter_clock/app/data/enums.dart';
import 'package:flutter_clock/app/data/theme_data.dart';
import 'package:flutter_clock/menu_info.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import './clock_view.dart';

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
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
      //   ],
      // ),
      VerticalDivider(
        color: CustomColors.dividerColor,
        width: 1,
      ),
      Expanded(
        child: Consumer<MenuInfo>(
          builder: (BuildContext context, MenuInfo value, Widget? child) {
            if (value.menuType != MenuType.clock) return Container();

            return Container(
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
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 24),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.center,
                      child: ClockView(
                        size: MediaQuery.of(context).size.height / 4,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TimeZone',
                          style: TextStyle(
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w500,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],),
    );
    // );
    //   ),
    // );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
        builder: (BuildContext context, MenuInfo value, Widget? child) {
      return MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(32)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
        color: currentMenuInfo.menuType == value.menuType
            ? CustomColors.menuBackgroundColor
            : CustomColors.pageBackgroundColor,
        onPressed: () {
          var menuInfo = Provider.of<MenuInfo>(context, listen: false);
          menuInfo.updateMenu(currentMenuInfo);
        },
        child: Column(
          children: <Widget>[
            Image.asset(
              currentMenuInfo.imageSource!,
              scale: 1.5,
            ),
            SizedBox(height: 16),
            Text(
              currentMenuInfo.title ?? '',
              style: TextStyle(
                fontFamily: 'avenir',
                color: CustomColors.primaryTextColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    });
  }
}
