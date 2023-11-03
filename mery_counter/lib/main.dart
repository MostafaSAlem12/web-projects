import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mery Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        highlightColor: Colors.transparent,
        primaryColor: const Color.fromARGB(255, 247, 220, 104),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 250, 227, 124),
        ),
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color.fromARGB(255, 241, 238, 229),
      ),
      home: const MyHomePage(title: 'هانت يا ميري'),
      locale: const Locale('ar'),
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
  final int _month12 = 11;
  final int _day12 = 30;
  final int _month6 = 5;
  final int _day6 = 31;
  late int _month = _month12;
  late int _day = _day12;
  int year = DateTime.now().year;
  late int days;
  late int hours;
  late int minutes;
  late int seconds;

  final List<String> _items = const [
    '1/12',
    '1/6',
  ];
  String value = '1/12';
  @override
  void initState() {
    _count();
    Timer.periodic(const Duration(milliseconds: 100), ((_) {
      setState(() {
        _count();
      });
    }));
    super.initState();
  }

  void setDofaa(String value) {
    this.value = value;
    switch (value) {
      case '1/12':
        setState(() {
          _month = _month12;
          _day = _day12;
          _count();
        });
        break;
      case '1/6':
        setState(() {
          _month = _month6;
          _day = _day6;
          _count();
        });
        break;
    }
  }

  void _count() {
    Duration difference =
        DateTime(year, _month, _day).difference(DateTime.now());
    days = difference.inDays;
    while (days < 0) {
      year++;
      difference = DateTime(year, _month, _day).difference(DateTime.now());
      days = difference.inDays;
    }
    hours = 23 - DateTime.now().hour;
    minutes = 59 - DateTime.now().minute;
    seconds = 59 - DateTime.now().second;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (context) => _items
                .map(
                  (val) => PopupMenuItem(
                    value: val,
                    child: Text('دفعة $val'),
                  ),
                )
                .toList(),
            onSelected: (value) {
              setDofaa(value);
            },
          )
        ],
        foregroundColor: Colors.grey.shade800,
        flexibleSpace: FlexibleSpaceBar(
          background: Opacity(
            opacity: 0.8,
            child: Image.asset(
              'assets/bg-mery.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg-mery.jpg'),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            Text(
              'دفعة $value/$year',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'يوم',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TimerContainer(time: days),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ساعة',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TimerContainer(time: hours),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'دقيقة',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TimerContainer(time: minutes),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ثانية',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TimerContainer(time: seconds),
                  ],
                ),
              ],
            ),
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TimerContainer extends StatelessWidget {
  final int time;
  const TimerContainer({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    final String timeString = time.toString().padLeft(2, '0');
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            const BoxShadow(
              offset: Offset.zero,
              color: Colors.white,
              blurRadius: 3,
              spreadRadius: 3,
              blurStyle: BlurStyle.inner,
            ),
            BoxShadow(
              offset: const Offset(1, 1),
              color: Colors.grey.shade400,
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                          begin: const Offset(0, -1.5), end: Offset.zero)
                      .animate(animation),
                  child: child,
                ),
              );
            },
            child: Text(
              timeString,
              key: ValueKey<String>(timeString),
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
