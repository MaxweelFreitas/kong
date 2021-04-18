import 'dart:async';

import 'package:flutter_triple/flutter_triple.dart';

// ignore: must_be_immutable
class HomeController extends NotifierStore<Exception, int> {
  HomeController() : super(0) {
    initialHeight = marioDy;
  }

  //--------------------------Variables-----------------------
  double marioDx = -1;
  double marioDy = 0.662;
  double time = 0;
  double height = 0;
  late double initialHeight;
  //--------------------------Moves---------------------------
  void moveLeft() async {
    if (marioDx >= -0.99) {
      //change state here
      marioDx -= 0.02;
    }
  }

  void moveRight() async {
    if (marioDx <= 1) {
      //change state here
      marioDx += 0.02;
    }
  }

  void moveUp() async {
    if (marioDy >= -0.99) {
      marioDy -= 0.02;
    }
  }

  void moveDown() async {
    if (marioDy <= 1) {
      //change state here
      marioDy += 0.02;
    }
  }

  void preJump() async {
    time = 0;
    initialHeight = marioDy;
  }

  void jump() async {
    preJump();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 5 * time;

      //change state here
      marioDy = initialHeight - height;
    });
  }

  Future<void> increment() async {
    setLoading(true);

    await Future.delayed(Duration(seconds: 1));

    var value = state + 1;
    if (value < 5) {
      update(value);
    } else {
      setError(Exception('Error: state not can be > 4'));
    }

    setLoading(false);
  }
}
