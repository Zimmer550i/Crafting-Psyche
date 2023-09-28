import 'package:flutter/material.dart';

class AssemblePhycheGame extends StatelessWidget {
  const AssemblePhycheGame({super.key});

  @override
  Widget build(BuildContext context) {
    List<bool> partsShown = List.filled(5, false);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

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
              DraggableParts(
                partsShown: partsShown,
              ),
              const Text(
                "Puzzle your way to unlock the Psyche asteroid's view in space",
                style: TextStyle(
                  fontFamily: "Arbutus",
                  fontSize: 20,
                  color: Color(0xffF7DE00),
                ),
              ),
              Center(
                child: Transform.scale(
                  scale: 1,
                  // scale: (w/300)*1.2,
                  child: Assembly(
                    partsShown: partsShown,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DraggableParts extends StatelessWidget {
  final double size;
  final List<bool> partsShown;
  const DraggableParts({super.key, this.size = 300, required this.partsShown});

  @override
  Widget build(BuildContext context) {
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
                hitTestBehavior: HitTestBehavior.deferToChild,
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
                hitTestBehavior: HitTestBehavior.deferToChild,
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
                hitTestBehavior: HitTestBehavior.deferToChild,
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
                hitTestBehavior: HitTestBehavior.deferToChild,
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
                hitTestBehavior: HitTestBehavior.deferToChild,
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
}

class Assembly extends StatefulWidget {
  final double size;
  final List<bool> partsShown;
  const Assembly({Key? key, this.size = 300.0, required this.partsShown})
      : super(key: key);

  @override
  State<Assembly> createState() => _AssemblyState();
}

class _AssemblyState extends State<Assembly> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: [
          //Draggable Logics

          Positioned(
            left: widget.size * 0.05,
            top: widget.size * 0.23,
            child: DragTarget(
              hitTestBehavior: HitTestBehavior.translucent,
              onAccept: (data) {
                if (data == "part1") {
                  setState(() {
                    widget.partsShown[0] = !widget.partsShown[0];
                  });
                }
              },
              builder: (context, candidateData, rejectedData) {
                return Transform.rotate(
                  angle: 5.7,
                  child: Opacity(
                    opacity: widget.partsShown[0] ? 1 : 0,
                    child: Image.asset(
                      "assets/images/phyche/part (1).png",
                    ),
                  ),
                );
              },
            ),
          ),

          Positioned(
            left: widget.size * 0.045,
            top: widget.size * 0.09,
            child: DragTarget(
              hitTestBehavior: HitTestBehavior.translucent,
              onAccept: (data) {
                if (data == "part2") {
                  setState(() {
                    widget.partsShown[1] = !widget.partsShown[1];
                  });
                }
              },
              builder: (context, candidateData, rejectedData) =>
                  Transform.rotate(
                angle: 3.85,
                child: Opacity(
                  opacity: widget.partsShown[0] ? 1 : 0,
                  child: Image.asset(
                    "assets/images/phyche/part (2).png",
                    scale: 0.95,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: widget.size * 0.22,
            top: widget.size * 0.12,
            child: DragTarget(
              hitTestBehavior: HitTestBehavior.translucent,
              onAccept: (data) {
                if (data == "part3") {
                  setState(() {
                    widget.partsShown[2] = !widget.partsShown[2];
                  });
                }
              },
              builder: (context, candidateData, rejectedData) =>
                  Transform.rotate(
                angle: 4.73,
                child: Opacity(
                  opacity: widget.partsShown[2] ? 1 : 0,
                  child: Image.asset(
                    "assets/images/phyche/part (3).png",
                    scale: 0.95,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: widget.size * 0.05,
            top: widget.size * 0.25,
            child: DragTarget(
              hitTestBehavior: HitTestBehavior.translucent,
              onAccept: (data) {
                if (data == "part4") {
                  setState(() {
                    widget.partsShown[3] = !widget.partsShown[3];
                  });
                }
              },
              builder: (context, candidateData, rejectedData) =>
                  Transform.rotate(
                angle: 1.85,
                child: Opacity(
                  opacity: widget.partsShown[3] ? 1 : 0,
                  child: Image.asset(
                    "assets/images/phyche/part (4).png",
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: widget.size * 0.33,
            bottom: widget.size * -0.02,
            child: Transform.rotate(
              angle: 4.62,
              child: Opacity(
                opacity: widget.partsShown[4] ? 1 : 0,
                child: DragTarget(
                  hitTestBehavior: HitTestBehavior.translucent,
                  onAccept: (data) {
                    if (data == "part5") {
                      setState(() {
                        widget.partsShown[4] = !widget.partsShown[4];
                      });
                    }
                  },
                  builder: (context, candidateData, rejectedData) =>
                      Image.asset(
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
              width: widget.size * 0.8,
              height: widget.size * 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
