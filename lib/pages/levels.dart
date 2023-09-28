import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mission_phyche_asteroid/pages/assemble_phyche_game.dart';
import 'package:mission_phyche_asteroid/pages/space_game.dart';
import 'package:mission_phyche_asteroid/widgets/buttons.dart';

class Levels extends StatelessWidget {
  const Levels({super.key});

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
                    func: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => GameWidget(
                            game: SpaceGame(),
                          ),
                        ),
                      );
                    },
                  ),
                  levels(
                    name: "Discover the Phyche",
                    title: "Level 2",
                    activaed: false,
                  ),
                  levels(
                    name: "Explore the Phyche's Secret",
                    title: "Level 3",
                    activaed: false,
                  ),
                  levels(
                    name: "Assemble The Phyche",
                    func: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const AssemblePhycheGame(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Buttons(
                    text: "Back",
                    size: 4,
                  ),
                  Buttons(
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
}