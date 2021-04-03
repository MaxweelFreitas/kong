import 'package:flutter/material.dart';
import 'package:kong/core/components/lattice/lattice_widget.dart';
import 'package:kong/core/components/stair/stair_top_widget.dart';
import 'package:kong/core/components/stair/stair_mid_widget.dart';
import 'package:kong/core/components/stair/stair_bot_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: statusBar),
            Row(
              children: [
                LatticeWidget(),
              ],
            ),
            SizedBox(height: 30),
            StairTopWidget(
              size: Size(100, 60),
            ),
            StairMidWidget(
              size: Size(100, 60),
            ),
            StairBotWidget(
              size: Size(100, 60),
            ),
          ],
        ),
      ),
    );
  }
}
