import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

void main() async {
  // 初始化AlarmClockManager service

  runApp(const MyApp());
  await AndroidAlarmManager.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //  定时器任务
  // Future<void> main() async {
  //   final int periodicId = 0;
  //   final int oneshotId = 0;
  //   final int oneshotAtId = 0;

  //   print("main alarm run");

  // }

  bool isOn = false;
  int alarmId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.scale(
              scale: 2,
              child: Switch(
                  value: isOn,
                  onChanged: ((value) {
                    setState(() {
                      isOn = value;
                    });
                    if (isOn == true) {
                      AndroidAlarmManager.oneShotAt(
                        DateTime(2022, 09, 25, 23, 19, 00),
                        alarmId,
                        () => FlutterAlarmClock.createAlarm(23, 59),
// your code
                      );
                    } else {
                      AndroidAlarmManager.cancel(alarmId);
                      print('Alarm Timer Canceled');
                    }
                  })),
            ),
            TextButton(
                onPressed: () {
                  setAlarmClock();
                  // FlutterAlarmClock.createAlarm(23, 59);
                },
                child: const Text("clock"))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void setAlarmClock() {
  // print('Alarm Fired at ${DateTime.now()}');
  FlutterAlarmClock.createAlarm(23, 59);
}
