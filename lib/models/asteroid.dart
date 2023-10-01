import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:mission_phyche_asteroid/models/player.dart';

class Asteroid extends SpriteComponent with HasGameRef, CollisionCallbacks {
  late double xAxis, yAxis, velocity, spriteSize;
  late CircleHitbox shape;
  bool isJunk;

  Asteroid(
      {this.xAxis = 50,
      this.yAxis = -50,
      this.velocity = 50,
      this.spriteSize = 70,
      this.isJunk = false})
      : super(size: Vector2.all(spriteSize));

  @override
  FutureOr<void> onLoad() async {
    sprite = isJunk ? await Sprite.load('junks/junk1.png') : await Sprite.load('asteroids/asteroid1.png');
    anchor = Anchor.center;
    shape = CircleHitbox.relative(0.8,
        parentSize: size, position: size / 2, anchor: Anchor.center);
    add(shape);
    x = xAxis;
    y = yAxis;
  }

  @override
  void update(double dt) {
    super.update(dt);
    // position = Vector2(xAxis, yAxis);
    y += velocity * dt;

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
