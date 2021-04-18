import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/components/characters/kong/kong.dart';
import '../../core/components/characters/mario/mario.dart';
import '../../core/components/characters/princess/princess.dart';
import '../../core/components/lattices/lattice_mounted.dart';
import '../../core/components/stairs/stair_mounted.dart';
import '../../core/constants/colors.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) async {
          if (event.runtimeType.toString() == 'RawKeyDownEvent') {
            if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
              controller.moveDown();
              setState(() {});
            }
            if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
              controller.moveUp();
              setState(() {});
            }
            if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
              controller.moveLeft();
              setState(() {});
            }
            if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
              controller.moveRight();
              setState(() {});
            }
          }
        },
        autofocus: true,
        child: Container(
          alignment: Alignment.center,
          child: Container(
            width: 375,
            height: 667,
            color: AppColors.bgScaffold,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                //--------------------------Lattices---------------------------
                Positioned(
                  left: 76,
                  bottom: 499,
                  child: LatticeMounted(numberOfPieces: 4),
                ),
                Positioned(
                  bottom: 421,
                  child: LatticeMounted(numberOfPieces: 9),
                ),
                Positioned(
                  right: 0,
                  bottom: 253,
                  child: LatticeMounted(numberOfPieces: 6),
                ),
                Positioned(
                  bottom: 85,
                  child: LatticeMounted(numberOfPieces: 9),
                ),
                //--------------------------Stairs-----------------------------
                Positioned(
                  left: 50,
                  bottom: 445,
                  child: StairMounted(numberOfPieces: 16),
                ),
                Positioned(
                  left: 176,
                  bottom: 445,
                  child: StairMounted(numberOfPieces: 6),
                ),
                Positioned(
                  right: 94,
                  bottom: 277,
                  child: StairMounted(numberOfPieces: 16),
                ),
                Positioned(
                  left: 177,
                  bottom: 109,
                  child: StairMounted(numberOfPieces: 16),
                ),
                //--------------------------Characters-------------------------
                Kong(),
                Princess(),
                AnimatedContainer(
                  alignment: Alignment(controller.marioDx, controller.marioDy),
                  duration: Duration(milliseconds: 0),
                  child: Mario(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
