import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/components/characters/mario/mario.dart';

import '../../core/components/lattices/lattice_mounted.dart';
import '../../core/components/stairs/stair_mounted.dart';
import '../../core/constants/colors.dart';
import 'scenario_controller.dart';

class ScenarioPage extends StatefulWidget {
  @override
  _ScenarioState createState() => _ScenarioState();
}

class _ScenarioState extends ModularState<ScenarioPage, ScenarioController> {
  @override
  Widget build(BuildContext context) {
    // var statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Container(
          width: 375,
          height: 667,
          color: AppColors.bgScaffold,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              //--------------------------Lattices-----------------------------
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
              //--------------------------Stairs-------------------------------
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
              //--------------------------Characters---------------------------
              Mario(),
            ],
          ),
        ),
      ),
    );
  }
}
