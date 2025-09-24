import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RFID Priority Scoring Engine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0071CE),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF0071CE),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class Item {
  final int id;
  final String name;
  final String emoji;
  final double value;
  final String correctSection;
  String misplacedSection;
  int gridIndex;
  int priority;
  String priorityLevel;
  String buyingLevel;
  Map<String, int> factors;
  DateTime timeFound;

  Item({
    required this.id,
    required this.name,
    required this.emoji,
    required this.value,
    required this.correctSection,
    required this.misplacedSection,
    required this.gridIndex,
    this.priority = 0,
    this.priorityLevel = 'low',
    this.buyingLevel = 'Low buying',
    Map<String, int>? factors,
    DateTime? timeFound,
  })  : factors = factors ?? {},
        timeFound = timeFound ?? DateTime.now();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item?> grid = List.filled(48, null);
  List<Item> items = [];
  int itemIdCounter = 0;
  String learningMessage = '';

  final Map<String, List<Map<String, dynamic>>> itemDatabase = {
    'electronics': [
      {'name': 'iPhone 15', 'value': 999, 'emoji': '📱'},
      {'name': 'iPad', 'value': 599, 'emoji': '📱'},
      {'name': 'AirPods', 'value': 179, 'emoji': '🎧'},
      {'name': 'Gaming Console', 'value': 499, 'emoji': '🎮'},
      {'name': 'Smart TV', 'value': 799, 'emoji': '📺'},
    ],
    'grocery': [
      {'name': 'Milk', 'value': 4, 'emoji': '🥛'},
      {'name': 'Bread', 'value': 3, 'emoji': '🍞'},
      {'name': 'Bananas', 'value': 2, 'emoji': '🍌'},
      {'name': 'Steak', 'value': 25, 'emoji': '🥩'},
      {'name': 'Wine', 'value': 15, 'emoji': '🍷'},
    ],
    'clothing': [
      {'name': 'Designer Jeans', 'value': 120, 'emoji': '👖'},
      {'name': 'T-Shirt', 'value': 15, 'emoji': '👕'},
      {'name': 'Sneakers', 'value': 85, 'emoji': '👟'},
      {'name': 'Jacket', 'value': 75, 'emoji': '🧥'},
      {'name': 'Hat', 'value': 25, 'emoji': '🧢'},
    ],
    'pharmacy': [
      {'name': 'Vitamins', 'value': 12, 'emoji': '💊'},
      {'name': 'Pain Relief', 'value': 8, 'emoji': '💊'},
      {'name': 'Shampoo', 'value': 6, 'emoji': '🧴'},
      {'name': 'Toothpaste', 'value': 4, 'emoji': '🦷'},
      {'name': 'Prescription', 'value': 50, 'emoji': '💊'},
    ],
  };

  final Map<String, double> algorithmWeights = {
    'value': 0.4,
    'location': 0.3,
    'time': 0.2,
    'frequency': 0.1,
  };

  @override
  void initState() {
    super.initState();
    _fillShelvesInitially();
  }

  void _fillShelvesInitially() {
    final sectionCounts = {
      'electronics': 12,
      'grocery': 12,
      'clothing': 12,
      'pharmacy': 12,
    };

    int slotIndex = 0;

    for (final section in sectionCounts.keys) {
      final itemsList = itemDatabase[section]!;

      int totalSlots = sectionCounts[section]!;
      int typesCount = itemsList.length;
      int baseCount = totalSlots ~/ typesCount;
      int remainder = totalSlots % typesCount;

      for (int typeIdx = 0; typeIdx < typesCount; typeIdx++) {
        final itemMap = itemsList[typeIdx];
        int count = baseCount + (typeIdx < remainder ? 1 : 0);

        for (int i = 0; i < count; i++) {
          if (slotIndex >= 48) break;

          final item = Item(
            id: itemIdCounter++,
            name: itemMap['name'] as String,
            emoji: itemMap['emoji'] as String,
            value: (itemMap['value'] as num).toDouble(),
            correctSection: section,
            misplacedSection: section,
            gridIndex: slotIndex,
          );

          final pr = calculatePriorityScore(item);
          item.priority = pr['score'];
          item.priorityLevel = pr['level'];
          item.buyingLevel = pr['buyingLevel'];
          item.factors = Map<String, int>.from(pr['factors']);

          items.add(item);
          grid[slotIndex] = item;
          slotIndex++;
        }
      }
    }

    sortItemsByPriority();
  }

  void showLearningMessage(String msg) {
    setState(() => learningMessage = msg);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => learningMessage = '');
    });
  }

  void sortItemsByPriority() {
    items.sort((a, b) => b.priority.compareTo(a.priority));
  }

  Map<String, dynamic> calculatePriorityScore(Item item) {
    final now = DateTime.now();
    final hoursSince = now.difference(item.timeFound).inMinutes / 60.0;
    final timeFactor = (hoursSince.clamp(0, 24) / 24);
    final valueFactor = (item.value / 1000).clamp(0, 1);

    final Map<String, double> locationSeverity = {
      'electronics-grocery': 0.9,
      'electronics-pharmacy': 0.7,
      'pharmacy-electronics': 0.8,
      'grocery-electronics': 0.6,
      'clothing-grocery': 0.4,
      'grocery-clothing': 0.3,
    };
    final locationKey = '${item.correctSection}-${item.misplacedSection}';
    final locationFactor =
        locationSeverity[locationKey] ?? (item.misplacedSection == '' ? 0.0 : 0.5);

    final frequencyFactor = Random().nextDouble() * 0.5 + 0.5;

    final score = ((valueFactor * algorithmWeights['value']!) +
            (locationFactor * algorithmWeights['location']!) +
            (timeFactor * algorithmWeights['time']!) +
            (frequencyFactor * algorithmWeights['frequency']!)) *
        100;

    final level = score >= 75 ? 'high' : score >= 40 ? 'medium' : 'low';

    String buyingLevel;
    if (frequencyFactor >= 0.75) {
      buyingLevel = 'High buying';
    } else if (frequencyFactor >= 0.5) {
      buyingLevel = 'Medium buying';
    } else {
      buyingLevel = 'Low buying';
    }

    return {
      'score': score.round(),
      'level': level,
      'buyingLevel': buyingLevel,
      'factors': {
        'value': (valueFactor * 100).round(),
        'location': (locationFactor * 100).round(),
        'time': (timeFactor * 100).round(),
        'frequency': (frequencyFactor * 100).round(),
      }
    };
  }

  void misplaceRandomItem() {
    final correctGridItems =
        items.where((i) => i.misplacedSection == i.correctSection).toList();
    if (correctGridItems.isEmpty) {
      showLearningMessage("⚠ No items left to misplace!");
      return;
    }

    final rnd = Random();
    final item = correctGridItems[rnd.nextInt(correctGridItems.length)];

    final sections = ['electronics', 'grocery', 'clothing', 'pharmacy'];
    String newSection;
    do {
      newSection = sections[rnd.nextInt(sections.length)];
    } while (newSection == item.correctSection);

    final emptySlots = List<int>.generate(48, (i) => i)
        .where((i) => sectionForIndex(i) == newSection && grid[i] == null)
        .toList();

    int newSlot;
    if (emptySlots.isNotEmpty) {
      newSlot = emptySlots[rnd.nextInt(emptySlots.length)];
    } else {
      final occupiedSlots = List<int>.generate(48, (i) => i)
          .where((i) => sectionForIndex(i) == newSection && grid[i] != null)
          .toList();
      newSlot = occupiedSlots[rnd.nextInt(occupiedSlots.length)];

      final otherItem = grid[newSlot]!;
      grid[item.gridIndex] = otherItem;
      otherItem.gridIndex = item.gridIndex;
    }

    setState(() {
      grid[item.gridIndex] = null;
      item.gridIndex = newSlot;
      item.misplacedSection = newSection;
      grid[newSlot] = item;

      final pr = calculatePriorityScore(item);
      item.priority = pr['score'];
      item.priorityLevel = pr['level'];
      item.buyingLevel = pr['buyingLevel'];
      item.factors = Map<String, int>.from(pr['factors']);
      sortItemsByPriority();

      showLearningMessage('❗ ${item.name} misplaced to $newSection!');
    });
  }

  void simulateRobotFeedback() {
    final misplaced =
        items.where((i) => i.misplacedSection != i.correctSection).toList();
    if (misplaced.isEmpty) {
      showLearningMessage('✅ No misplaced items to fix!');
      return;
    }

    final rnd = Random();
    final item = misplaced[rnd.nextInt(misplaced.length)];

    final candidateSlots = List<int>.generate(48, (i) => i)
        .where((i) => sectionForIndex(i) == item.correctSection && grid[i] == null)
        .toList();
    if (candidateSlots.isEmpty) return;

    final newSlot = candidateSlots[rnd.nextInt(candidateSlots.length)];

    setState(() {
      grid[item.gridIndex] = null;
      item.gridIndex = newSlot;
      item.misplacedSection = item.correctSection;
      grid[newSlot] = item;

      final pr = calculatePriorityScore(item);
      item.priority = pr['score'];
      item.priorityLevel = pr['level'];
      item.buyingLevel = pr['buyingLevel'];
      item.factors = Map<String, int>.from(pr['factors']);
      sortItemsByPriority();

      showLearningMessage('🤖 Item checked back in: ${item.name}');
    });
  }

  void resetDemo() {
    setState(() {
      items.clear();
      grid = List.filled(48, null);
      itemIdCounter = 0;
      learningMessage = 'Demo reset.';
    });
    _fillShelvesInitially();
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => learningMessage = '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RFID Priority Scoring Engine'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Image.network(
              'data:image/jpeg;base64,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',
              height: 40,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 48,
                itemBuilder: (context, index) {
                  final section = sectionForIndex(index);
                  final shelfItem = grid[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: sectionColor(section), width: 2),
                    ),
                    child: Center(
                        child: shelfItem != null
                            ? Text(shelfItem.emoji,
                                style: const TextStyle(fontSize: 26))
                            : null),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(height: 6),
                  const Text(
                    '🎯 Priority Queue',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0071CE),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (learningMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        learningMessage,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF0071CE),
                        ),
                      ),
                    ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.where((i) => i.misplacedSection != i.correctSection).length,
                      itemBuilder: (context, idx) {
                        final misplacedItems = items.where((i) => i.misplacedSection != i.correctSection).toList();
                        final item = misplacedItems[idx];
                        return Card(
                          color: priorityColor(item.priorityLevel),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: Text(item.emoji, style: const TextStyle(fontSize: 22)),
                            title: Text(item.name),
                            subtitle: Text('${item.correctSection} → ${item.misplacedSection}'),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${item.priority}'),
                                const SizedBox(height: 2),
                                Text(item.priorityLevel, style: const TextStyle(fontSize: 10)),
                                Text(item.buyingLevel, style: const TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: misplaceRandomItem,
                          child: const Text('Misplace Item'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: simulateRobotFeedback,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
                          child: const Text('Simulate Robot'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: resetDemo,
                    child: const Text('Reset Demo'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helpers
  String sectionForIndex(int index) {
    if (index < 12) return 'electronics';
    if (index < 24) return 'grocery';
    if (index < 36) return 'clothing';
    return 'pharmacy';
  }

  Color sectionColor(String section) {
    switch (section) {
      case 'electronics':
        return Colors.yellow;
      case 'grocery':
        return Colors.green;
      case 'clothing':
        return Colors.purple;
      case 'pharmacy':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  Color priorityColor(String level) {
    switch (level) {
      case 'high':
        return Colors.red.shade100;
      case 'medium':
        return Colors.orange.shade100;
      case 'low':
      default:
        return Colors.green.shade100;
    }
  }
}
