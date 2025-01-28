import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:orientations/alarmpage.dart';
import 'package:orientations/clockpage.dart';
import 'package:orientations/enum.dart';
import 'package:orientations/theme_data.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'menu_info.dart';

class custompainter extends StatefulWidget {
  const custompainter({super.key});

  @override
  State<custompainter> createState() => _custompainterState();
}

class _custompainterState extends State<custompainter> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);
    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems
                  .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                  .toList()),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if(value.menuType == MenuType.Clock) return ClockPage();
                else if(value.menuType == MenuType.Alarm)
                  return const AlarmPage();
                else
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  Consumer<MenuInfo> buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: TextButton(
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
                  backgroundColor: currentMenuInfo.menuType == value.menuType
                      ? CustomColors.menuBackgroundColor
                      : CustomColors.pageBackgroundColor),
              onPressed: () {
                var menuInfo = Provider.of<MenuInfo>(context, listen: false);
                menuInfo.UpdateMenu(currentMenuInfo);
              },
              child: Column(
                children: [
                  Image.asset(
                    currentMenuInfo.imagesource,
                    scale: 1.5,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    currentMenuInfo.title ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'avenir',
                        fontSize: 14),
                  )
                ],
              )),
        );
      },
    );
  }
}
