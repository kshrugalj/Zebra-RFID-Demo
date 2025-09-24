class Item {
  final int id;
  final String name;
  final String emoji;
  final double value;
  final String correctSection;
  String misplacedSection;
  DateTime timeFound;
  int priority;
  String priorityLevel;

  // Factors for scoring
  int valueFactor;
  int locationFactor;
  int timeFactor;
  int frequencyFactor;

  Item({
    required this.id,
    required this.name,
    required this.emoji,
    required this.value,
    required this.correctSection,
    required this.misplacedSection,
    required this.timeFound,
    required this.priority,
    required this.priorityLevel,
    this.valueFactor = 0,
    this.locationFactor = 0,
    this.timeFactor = 0,
    this.frequencyFactor = 0,
  });
}
