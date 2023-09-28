import 'package:flutter/material.dart';

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
                  opacity:  widget.partsShown[0] ? 1 :0,
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
                  opacity:  widget.partsShown[2] ? 1 :0,
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
                  opacity:  widget.partsShown[3] ? 1 :0,
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
                opacity:  widget.partsShown[4] ? 1 :0,
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
        ],
      ),
    );
  }
}
