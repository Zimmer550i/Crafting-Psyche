import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:mission_phyche_asteroid/main.dart';
import 'package:mission_phyche_asteroid/models/asteroid.dart';
import 'package:mission_phyche_asteroid/models/level.dart';
import 'package:mission_phyche_asteroid/models/player.dart';
import 'package:mission_phyche_asteroid/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpaceGame extends FlameGame with HasCollisionDetection, PanDetector {
  late Player player;
  final Level level;
  late TextComponent distance;
  bool increased = false;

  SpaceGame({required this.level});

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
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
        priority: 1);

    add(distance);
  }

  Future<void> _saveProgress() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setStringList('progress', progress);
  }

  @override
  void update(double dt) {
    super.update(dt);
    level.time += level.isEndless ? 1 * dt : -1 * dt;
    distance.text = "Distance: ${level.time.toInt()}";

    if (level.time < 1 && !level.isEndless) {
      overlays.add('pause');
      if (level.name == 'level1') {
        progress[1] = 'true';
      }else if (level.name == 'level2') {
        progress[2] = 'true';
      }else if (level.name == 'level3') {
        progress[3] = 'true';
      }
      _saveProgress();
    }

    if (level.isEndless && !increased && level.time.toInt() % 50 == 0) {
      level.occurence -= 0.1;
      level.speed += 0.1;
      increased = true;
    } else if (level.time.toInt() % 50 == 1) {
      increased = false;
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
        velocity: level.speed,
        isJunk: level.isJunk,
      ));
    }
  }
}
