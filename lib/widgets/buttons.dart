import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  final double size;
  final double widthMultiplyer;
  final bool isGrayed;
  final void Function()? func;

  const Buttons(
      {Key? key,
      required this.text,
      this.func,
      this.isGrayed = false,
      this.size = 5,
      this.widthMultiplyer = 1.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 6),
        child: ColorFiltered(
          colorFilter: isGrayed
              ? const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.saturation,
                )
              : const ColorFilter.mode(Colors.white, BlendMode.darken),
          child: Container(
            height: size * 15,
            width: size * 15 * widthMultiplyer,
            padding: EdgeInsets.only(
              top: size,
              bottom: size * 2,
              left: size,
              right: size,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(size * 6),
            ),
            child: Container(
              padding: EdgeInsets.all(size * 2),
              decoration: BoxDecoration(
                color: const Color(0xffFEEA76),
                borderRadius: BorderRadius.circular(size * 5),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffffc714),
                    Color(0xffFFB213),
                  ],
                  stops: [0.5, 0.5],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, size),
                    color: const Color(0xffFF8413),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: "Arbutus",
                    fontSize: size * 5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
