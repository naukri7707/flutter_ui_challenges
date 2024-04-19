import 'package:flutter/material.dart';

import 'present/countdown_timer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'CircularProgressIndicator',
                ),
                Tab(
                  text: 'CustomPainter',
                ),
              ],
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.all(16.0),
            // Use Center as layout has unconstrained width (loose constraints),
            // together with SizedBox to specify the max width (tight constraints)
            // See this thread for more info:
            // https://twitter.com/biz84/status/1445400059894542337
            child: Center(
              child: SizedBox(
                width: 300, // max allowed width
                child: TabBarView(
                  children: [
                    CountdownTimer(
                      maxRemainingTime: Duration(seconds: 10),
                      drawRingByPainter: true,
                    ),
                    CountdownTimer(
                      maxRemainingTime: Duration(seconds: 10),
                      drawRingByPainter: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
