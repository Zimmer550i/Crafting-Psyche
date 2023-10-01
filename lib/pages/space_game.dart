import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:mission_phyche_asteroid/models/asteroid.dart';
import 'package:mission_phyche_asteroid/models/level.dart';
import 'package:mission_phyche_asteroid/models/player.dart';

class SpaceGame extends FlameGame with HasCollisionDetection, PanDetector {
  late Random _random;
  late Player player;
  final Level level;
  late TextComponent distance;

  SpaceGame({required this.level});

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    _random = Random();
    // debugMode = true;
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

    addAsteroids();
    player = Player();
    add(player);
    // TextComponent time = TextComponent();

    distance = TextComponent(
      text: "Distance: ${level.time.toInt()}",
      textRenderer: TextPaint(
        style: const TextStyle(
          fontFamily: "Arbutus",
          fontSize: 20,
          color: Color(0xffF7DE00),
        ),
      ),
      anchor: Anchor.topRight,
      position: Vector2(size.x, 40),
    );

    add(distance);
    
  }

  @override
  void update(double dt) {
    super.update(dt);
    level.time += level.isEndless ? 1 * dt : -1 * dt;
    distance.text = "Distance: ${level.time.toInt()}";

    if (level.time<1 && !level.isEndless) {
      overlays.add('pause');
    }
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    super.onPanUpdate(info);
    player.angle += info.delta.game.x / 100;

    if (player.angle > 1.57079633) {
      player.angle = 1.57079633;
    } else if (player.angle < -1.57079633) {
      player.angle = -1.57079633;
    }
  }

  void addAsteroids() async {
    while (true) {
      await Future.delayed(
        Duration(milliseconds: (1000 * level.occurence).toInt()),
      );
      add(Asteroid(
        xAxis: _random.nextInt(size.x.toInt()).toDouble(),
        yAxis: _random.nextInt(50).toDouble() - 100.0,
        velocity: _random.nextInt(100).toDouble() + level.speed,
        spriteSize: _random.nextInt(50) + 70.0,
        isJunk: level.isJunk,
      ));
    }
  }
}
