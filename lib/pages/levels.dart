import 'package:flutter/material.dart';
import 'package:mission_phyche_asteroid/models/level.dart';
import 'package:mission_phyche_asteroid/pages/assemble_phyche_game.dart';
import 'package:mission_phyche_asteroid/pages/loading_screen_1.dart';
import 'package:mission_phyche_asteroid/utils/constants.dart';
import 'package:mission_phyche_asteroid/widgets/buttons.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/background_low_res.png",
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  levels(
                    name: "Road to Mars",
                    title: "Level 1",
                    activaed: progress[0] == 'true',
                    func: () => launchGame(
                      context,
                      Level(
                        "level1",
                        occurence: 1.2,
                        speed: 100,
                        time: 50,
                        isJunk: true,
                      ),
                    ),
                  ),
                  levels(
                    name: "Discover the Phyche",
                    title: "Level 2",
                    activaed: progress[1] == 'true',
                    func: () => launchGame(
                      context,
                      Level(
                        "level2",
                        occurence: 1,
                        speed: 120,
                        time: 100,
                      ),
                    ),
                  ),
                  levels(
                    name: "Explore the Phyche's Secret",
                    title: "Level 3",
                    activaed: progress[2] == 'true',
                    func: () => launchGame(
                      context,
                      Level(
                        "level3",
                        occurence: 0.8,
                        speed: 160,
                        time: 1,
                      ),
                    ),
                  ),
                  levels(
                    name: "Assemble The Phyche",
                    activaed: progress[3] == 'true',
                    func: () {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (_) => const AssemblePhycheGame(),
                        ),
                      )
                          .then((value) {
                        setState(() {});
                      });
                    },
                  ),
                  levels(
                    name: "Endless Mode",
                    activaed: progress[4] == 'true',
                    func: () => launchGame(
                      context,
                      Level("endless",
                          occurence: 1, speed: 50, time: 0, isEndless: true),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Buttons(
                    text: "Back",
                    size: 4,
                    func: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Buttons(
                    text: "Help",
                    size: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget levels({
    required String name,
    String? title,
    bool activaed = true,
    void Function()? func,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Container(
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
              offset: Offset(0, 5),
              color: Color(0xffDABF23),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              title == null
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff1E4680),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Arbutus",
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Arbutus",
                  fontSize: 30,
                  color: Color(0xff1E4680),
                ),
              ),
              Buttons(
                text: "Play",
                size: 3,
                widthMultiplyer: 4,
                isGrayed: !activaed,
                func: func,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void launchGame(BuildContext context, Level level) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => LoadingScreen1(level: level)))
        .then((value) {
      setState(() {});
    });
  }
}
