import 'dart:async';
import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:mission_phyche_asteroid/models/player.dart';

class Asteroid extends SpriteComponent with HasGameRef, CollisionCallbacks {
  late double velocity, rotation;
  late Random _random;
  late CircleHitbox shape;
  bool isJunk;

  Asteroid({this.velocity = 50, this.isJunk = false});

  @override
  FutureOr<void> onLoad() async {
    _random = Random();
    sprite = isJunk
        ? await Sprite.load('junks/junk${1}.png')
        : await Sprite.load('asteroids/asteroid${1}.png');
    anchor = Anchor.center;
    shape = CircleHitbox.relative(0.8,
        parentSize: size, position: size / 2, anchor: Anchor.center);
    add(shape);
    x = _random.nextInt(gameRef.size.x.toInt()).toDouble();
    y = _random.nextInt(50).toDouble() - 100.0;
    size = Vector2.all(_random.nextInt(50) + 70.0);
    velocity += _random.nextInt(100).toDouble();
    angle = _random.nextDouble() * 3.1416;
    rotation =
        _random.nextBool() ? _random.nextDouble() : -_random.nextDouble();
  }

  @override
  void update(double dt) {
    super.update(dt);
    y += velocity * dt;

    angle += rotation / 100;

    if (y > gameRef.size.y) {
      gameRef.remove(this);
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Player) {
      gameRef.remove(this);
    }
  }

  void changeSprite() async {
    sprite = await Sprite.load('background.png');
    remove(shape);
    await Future.delayed(const Duration(seconds: 1));
    try {
      gameRef.remove(this);
      // ignore: empty_catches
    } catch (e) {}
  }
}
