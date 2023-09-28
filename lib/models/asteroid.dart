import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Asteroid extends SpriteComponent with HasGameRef, CollisionCallbacks {
  double xAxis, yAxis, velocity, spriteSize;
  late CircleHitbox shape;

  Asteroid(
      {this.xAxis = 50,
      this.yAxis = -50,
      this.velocity = 50,
      this.spriteSize = 70})
      : super(size: Vector2.all(spriteSize));

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('asteroid.png');
    anchor = Anchor.center;
    shape = CircleHitbox.relative(0.8,
        parentSize: size, position: size / 2, anchor: Anchor.center);
    add(shape);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position = Vector2(xAxis, yAxis);
    yAxis += velocity * dt;

    if (yAxis > gameRef.size.y) {
      gameRef.remove(this);
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    changeSprite();
  }

  void changeSprite() async {
    sprite = await Sprite.load('background.png');
    remove(shape);
    await Future.delayed(const Duration(seconds: 1));
    gameRef.remove(this);
  }
}
