class Level {
  final String name;
  double speed;
  double occurence;
  double time;
  bool isJunk;
  bool isEndless;

  Level(
    this.name, {
    required this.occurence,
    required this.speed,
    required this.time,
    this.isJunk = false,
    this.isEndless = false});
}
