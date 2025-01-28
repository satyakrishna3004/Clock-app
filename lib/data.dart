import 'package:orientations/enum.dart';
import 'package:orientations/theme_data.dart';
import 'alarminfo.dart';
import 'menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.Clock,
      title: 'Clock',
      imagesource:
          'assets/clock_icon.png'),
  MenuInfo(MenuType.Alarm,
      title: 'Alarm',
      imagesource:
      'assets/alarm_icon.png'),
  MenuInfo(MenuType.Timer,
      title: 'Timer',
      imagesource:
      'assets/timer_icon.png'),
  MenuInfo(MenuType.Stopwatch,
      title: 'StopWatch',
      imagesource:
      'assets/stopwatch_icon.png'),
];
List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(const Duration(hours: 1)), description: "College",isActive: true,gradientColor: GradientColors.sky),
  AlarmInfo(DateTime.now().add(const Duration(hours: 2)), description: "Gym",isActive: true,gradientColor: GradientColors.sunset),
];
