import 'package:flutter/material.dart';

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
