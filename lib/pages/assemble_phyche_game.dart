import 'package:flutter/material.dart';
import 'package:mission_phyche_asteroid/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssemblePhycheGame extends StatefulWidget {
  const AssemblePhycheGame({super.key});

  @override
  State<AssemblePhycheGame> createState() => _AssemblePhycheGameState();
}

class _AssemblePhycheGameState extends State<AssemblePhycheGame> {
  double size = 300;
  List<bool> partsShown = List.filled(5, false);
  late List<Widget> partsList;

  @override
  void initState() {
    super.initState();
    initList();
  }

  Future<void> _saveProgress() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setStringList('progress', progress);
  }

  void _checkCompleted() {
    if (partsShown.every((element) => element == true)) {
      progress[4] = 'true';
      _saveProgress();
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    _checkCompleted();

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background_low_res.png",
            fit: BoxFit.cover,
            height: h,
            width: w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              draggables(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Puzzle your way to unlock the Psyche asteroid's view in space",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Arbutus",
                    fontSize: 20,
                    color: Color(0xffF7DE00),
                  ),
                ),
              ),
              assembly(),
            ],
          ),
        ],
      ),
    );
  }

  Widget assembly() {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(children: partsList),
    );
  }

  Widget draggables() {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(color: Color(0x3F3D3D75)),
      child: Stack(
        children: [
          Visibility(
            visible: !partsShown[0],
            child: Positioned(
              child: Draggable(
                onDragStarted: () => rearrange(1),
                onDragCompleted: () => initList(),
                data: "part1",
                feedback: Image.asset("assets/images/phyche/part (1).png"),
                child: Image.asset("assets/images/phyche/part (1).png"),
              ),
            ),
          ),
          Visibility(
            visible: !partsShown[1],
            child: Positioned(
              left: 120,
              child: Draggable(
                onDragStarted: () => rearrange(2),
                onDragCompleted: () => initList(),
                data: "part2",
                feedback: Image.asset("assets/images/phyche/part (2).png"),
                child: Image.asset("assets/images/phyche/part (2).png"),
              ),
            ),
          ),
          Visibility(
            visible: !partsShown[2],
            child: Positioned(
              top: 150,
              child: Draggable(
                onDragStarted: () => rearrange(3),
                onDragCompleted: () => initList(),
                data: "part3",
                feedback: Image.asset("assets/images/phyche/part (3).png"),
                child: Image.asset("assets/images/phyche/part (3).png"),
              ),
            ),
          ),
          Visibility(
            visible: !partsShown[3],
            child: Positioned(
              top: 150,
              left: 100,
              child: Draggable(
                onDragStarted: () => rearrange(4),
                onDragCompleted: () => initList(),
                data: "part4",
                feedback: Image.asset("assets/images/phyche/part (4).png"),
                child: Image.asset("assets/images/phyche/part (4).png"),
              ),
            ),
          ),
          Visibility(
            visible: !partsShown[4],
            child: Positioned(
              top: 10,
              right: 0,
              child: Draggable(
                onDragStarted: () => rearrange(5),
                onDragCompleted: () => initList(),
                data: "part5",
                feedback: Image.asset("assets/images/phyche/part (5).png"),
                child: Image.asset("assets/images/phyche/part (5).png"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void rearrange(int n) {
    var temp = partsList.removeAt(n - 1);
    setState(() {
      partsList.add(temp);
    });
  }

  void initList() {
    partsList = [
      Positioned(
        left: size * 0.05,
        top: size * 0.23,
        child: DragTarget(
          onAccept: (data) {
            if (data == "part1") {
              setState(() {
                partsShown[0] = !partsShown[0];
              });
            }
          },
          builder: (context, candidateData, rejectedData) {
            return Transform.rotate(
              angle: 5.7,
              child: Opacity(
                opacity: partsShown[0] ? 1 : 0,
                child: Image.asset(
                  "assets/images/phyche/part (1).png",
                ),
              ),
            );
          },
        ),
      ),
      Positioned(
        left: size * 0.045,
        top: size * 0.09,
        child: DragTarget(
          onAccept: (data) {
            if (data == "part2") {
              setState(() {
                partsShown[1] = !partsShown[1];
              });
            }
          },
          builder: (context, candidateData, rejectedData) => Transform.rotate(
            angle: 3.85,
            child: Opacity(
              opacity: partsShown[1] ? 1 : 0,
              child: Image.asset(
                "assets/images/phyche/part (2).png",
                scale: 0.95,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        right: size * 0.22,
        top: size * 0.12,
        child: DragTarget(
          onAccept: (data) {
            if (data == "part3") {
              setState(() {
                partsShown[2] = !partsShown[2];
              });
            }
          },
          builder: (context, candidateData, rejectedData) => Transform.rotate(
            angle: 4.73,
            child: Opacity(
              opacity: partsShown[2] ? 1 : 0,
              child: Image.asset(
                "assets/images/phyche/part (3).png",
                scale: 0.95,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        right: size * 0.05,
        top: size * 0.25,
        child: DragTarget(
          onAccept: (data) {
            if (data == "part4") {
              setState(() {
                partsShown[3] = !partsShown[3];
              });
            }
          },
          builder: (context, candidateData, rejectedData) => Transform.rotate(
            angle: 1.85,
            child: Opacity(
              opacity: partsShown[3] ? 1 : 0,
              child: Image.asset(
                "assets/images/phyche/part (4).png",
              ),
            ),
          ),
        ),
      ),
      Positioned(
        right: size * 0.33,
        bottom: size * -0.02,
        child: DragTarget(
          onAccept: (data) {
            if (data == "part5") {
              setState(() {
                partsShown[4] = !partsShown[4];
              });
            }
          },
          builder: (context, candidateData, rejectedData) => Transform.rotate(
            angle: 4.62,
            child: Opacity(
              opacity: partsShown[4] ? 1 : 0,
              child: Image.asset(
                "assets/images/phyche/part (5).png",
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/phyche/outline.png",
          width: size * 0.8,
          height: size * 0.8,
        ),
      ),
    ];
  }
}
