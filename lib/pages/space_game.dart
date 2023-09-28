import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:mission_phyche_asteroid/models/asteroid.dart';

class SpaceGame extends FlameGame with HasCollisionDetection {
  late Random _random;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    _random = Random();
    // Sprite sprite = await Sprite.load('background.jpg');
    ParallaxComponent parallaxComponent = await loadParallaxComponent(
      [
        ParallaxImageData('background_low_res.png'),
      ],
      repeat: ImageRepeat.repeatY,
      fill: LayerFill.width,
      baseVelocity: Vector2(0, -20),
      velocityMultiplierDelta: Vector2(1.6, 1.0),
    );

    add(parallaxComponent);
    // add(SpriteComponent(
    //   sprite: sprite,
    //   size: size,
    // ));

    addAsteroids();
  }

  void addAsteroids() async {
    while (true) {
      await Future.delayed(
        const Duration(milliseconds: 1000),
      );
      add(Asteroid(
        xAxis: _random.nextInt(size.x.toInt()).toDouble(),
        yAxis: _random.nextInt(50).toDouble() - 100.0,
        velocity: _random.nextInt(100).toDouble() + 100.0,
        spriteSize: _random.nextInt(50) + 70.0,
      ));
    }
  }
}
