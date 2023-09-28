import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mission_phyche_asteroid/pages/levels.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  void changePage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Levels()));
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    changePage(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            "assets/images/background_low_res.png",
            fit: BoxFit.fill,
          ),
          Positioned(
            width: w / 1.5,
            height: h / 3,
            right: -30,
            top: 50,
            child: Transform.rotate(
              angle: -45,
              child: Image.asset(
                "assets/images/ship_1.gif",
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .move(
                    begin: const Offset(0, 0),
                    end: const Offset(-20, 20),
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 4000),
                  ),
            ),
          ),
          Positioned(
            top: h / 4,
            left: 0,
            right: 0,
            child: Image.asset("assets/images/text_logo.png"),
          ),
          Positioned(
            right: 90,
            bottom: 200,
            child: Image.asset("assets/images/astronaut_1.png")
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .moveY(
                  begin: 0,
                  end: 20,
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 2000),
                ),
          ),
          Positioned(
            left: 20,
            bottom: 10,
            child: Image.asset("assets/images/astronaut_2.png"),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Image.asset("assets/images/astronaut_3.png"),
          ),
        ],
      ),
    );
  }
}
