import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:orientations/data.dart';
import 'package:orientations/theme_data.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       // margin: EdgeInsets.only(bottom: 20,),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alarm',
            style: TextStyle(
                fontFamily: 'avenir',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          Expanded(
            child: ListView(
              children: alarms.map<Widget>((alarm) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: alarm.gradientColor,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      boxShadow: [
                        BoxShadow(
                            color: alarm.gradientColor.last.withOpacity(0.4),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: const Offset(4, 4)),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(24))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.label,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'College',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'avenir',
                                ),
                              ),
                              SizedBox(
                                width: 72,
                              )
                            ],
                          ),
                          Switch(
                            value: true,
                            onChanged: (bool value) {},
                            activeColor: Colors.white,
                          )
                        ],
                      ),
                      const Text(
                        'Mon-Sat',
                        style: TextStyle(
                            fontFamily: 'avenir', color: Colors.white),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '6:00 AM',
                            style: TextStyle(
                                fontFamily: 'avenir',
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                            size: 36,
                          )
                        ],
                      ),
                    ],
                  ),
                );
               }
              ).followedBy([
                SizedBox(height: 20,),
                DottedBorder(
                  dashPattern: const [5, 4],
                  strokeWidth: 3,
                  color: CustomColors.clockOutline,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(24),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomColors.clockBG,
                      borderRadius: const BorderRadius.all(Radius.circular(24))
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                    child: TextButton(
                      onPressed: (){},
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/add_alarm.png',
                            scale: 1.5,
                          ),
                          const SizedBox(height: 8,),
                          const Text('Add Alarm',style: TextStyle(color: Colors.white,fontFamily: 'avenir'),),
                        ],
                      ),
                    ),
                  ),
                )
              ]).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
