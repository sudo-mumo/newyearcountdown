import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:new_year_countdown/widgets/countdown_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime newYear = DateTime.parse("2024-01-01T00:00:00");
  Map<String, dynamic> timeLeft = HashMap();
  bool itsNewYear = false;
  Timer? timer;

  Map<String, dynamic> mapTimeLeft(int value) {
    int days, hours, minutes, seconds;

    days = value ~/ 86400;
    hours = (value - days * 86400) ~/ 3600;
    minutes = (value - (days * 86400) - (hours * 3600)) ~/ 60;
    seconds = (value - (days * 86400) - (hours * 3600) - (minutes * 60));

    if (days == 0) {
      if (hours == 0) {
        if (minutes == 0) {
          if (seconds == 0) {
            itsNewYear = true;
          }
        } else {
          timeLeft.addAll({'Minutes': minutes, 'Seconds': seconds});
          return timeLeft;
        }
      } else {
        timeLeft
            .addAll({'Hours': hours, 'Minutes': minutes, 'Seconds': seconds});
        return timeLeft;
      }
    } else {
      timeLeft.addAll({
        'Days': days,
        'Hours': hours,
        'Minutes': minutes,
        'Seconds': seconds
      });
      var newMap = <String, dynamic>{};
      for (var key in ["Days", "Hours", "Minutes", "Seconds"]) {
        if (timeLeft.containsKey(key)) newMap[key] = timeLeft[key];
      }
      timeLeft = newMap;
      return timeLeft;
    }
    return timeLeft;
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => setState(
        () {
          DateTime currentTime = DateTime.now();
          mapTimeLeft(
            newYear.difference(currentTime).inSeconds,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: itsNewYear
            ? const Text(
                'I Wish You All\nA Happy & Prosperous New Year\n2023\nCheers',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Countdown to Year 2024',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: timeLeft.entries
                        .map((e) => CountDownWidget(
                              timeDescription: e.key,
                              timeValue: e.value,
                            ))
                        .toList(),
                  )
                ],
              ),
      ),
    );
  }
}
