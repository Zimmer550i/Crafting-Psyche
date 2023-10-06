import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  double velocity;
  late RectangleHitbox shape;
  int health;

  Player({this.velocity = 50, this.health = 100});

  @override
  FutureOr<void> onLoad() async {
    SpriteSheet spriteSheet;
    if (gameRef.size.x > 420) {
      final image = await Flame.images.load('spaceship/ship1.png');
      spriteSheet = SpriteSheet(image: image, srcSize: Vector2(400, 400));
    } else {
      final image = await Flame.images.load('ship.png');
      spriteSheet = SpriteSheet(image: image, srcSize: Vector2(200, 200));
    }
    final animationComponent =
        spriteSheet.createAnimation(row: 0, stepTime: 0.05);
    animation = animationComponent;
    anchor = Anchor.center;
    shape = RectangleHitbox.relative(Vector2(0.2, 0.4), parentSize: size);
    add(shape);
    x = gameRef.size.x / 2;
    y = gameRef.size.y - size.y;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (angle != 0) {
      x += angle * 2;
    }
    if (x < 1 && angle < 0) {
      x = 0;
      angle += 0.1;
    }
    if (x > game.size.x && angle > 0) {
      x = game.size.x;
      angle -= 0.1;
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    health -= 10;

    var moveByEffect = MoveByEffect(
      Vector2.all(10),
      EffectController(duration: 1),
    );
    game.camera.viewfinder.add(moveByEffect);
  }
}
