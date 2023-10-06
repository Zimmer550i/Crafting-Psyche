import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mission_phyche_asteroid/models/level.dart';
import 'package:mission_phyche_asteroid/pages/space_game.dart';
import 'package:mission_phyche_asteroid/widgets/buttons.dart';

class LoadingScreen1 extends StatelessWidget {
  final Level level;
  const LoadingScreen1({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/background_low_res.png",
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w / 10, vertical: h / 10),
            child: Container(
              padding: const EdgeInsets.all(15),
              constraints: const BoxConstraints(
                minHeight: 200,
                minWidth: 400,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFEEA76),
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffFEEA76),
                    Color.fromARGB(255, 243, 215, 58),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                    color: Color(0xffDABF23),
                  )
                ],
              ),
              child: Column(
                children: [
                  Image.asset("assets/images/level1.webp"),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Road to Mars",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Arbutus",
                        fontSize: 25,
                        color: Color(0xff1E4680),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    "Embarking on our voyage to Mars commences with a formidable challenge. Our mission to reach the Red Planet necessitates a departure from Earth, skillfully navigating the treacherous sea of space debris that surrounds us. Prepare yourselves, fasten your restraints, and stand ready to expertly guide our spacecraft on this remarkable journey.",
                    style: TextStyle(
                      fontFamily: "Arbutus",
                      fontSize: 14,
                      color: Color(0xff1E4680),
                    ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Buttons(
                        text: "Back",
                        size: 4,
                        func: () => Navigator.of(context).pop(),
                      ),
                      Buttons(
                        text: "Play",
                        size: 4,
                        func: () => launchSpaceGame(context, level),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  launchSpaceGame(BuildContext context, Level level) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GameWidget(
          overlayBuilderMap: {
            "pause": (BuildContext context, SpaceGame game) {
              game.pauseEngine();
              return Center(
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontFamily: "Arbutus",
                    fontSize: 35,
                    color: Color(0xffF7DE00),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Paused"),
                      const SizedBox(height: 20),
                      Buttons(
                        text: "Unpause",
                        widthMultiplyer: 2,
                        func: () {
                          game.overlays.remove('pause');
                          game.resumeEngine();
                        },
                      ),
                      const SizedBox(height: 20),
                      Buttons(
                        text: "Go Back",
                        widthMultiplyer: 2,
                        func: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          },
          game: SpaceGame(level: level),
        ),
      ),
    );
  }
}
