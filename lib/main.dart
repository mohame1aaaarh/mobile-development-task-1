import 'dart:math';
import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          titleLarge: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int _dice1 = 1;
  int _dice2 = 1;
  int _total = 2;
  String _imagePath = 'assets/images/sad.png';

  @override
  Widget build(BuildContext context) {
    final bool isWin = _total >= 10;
    final String resultText = isWin ? 'You Win' : 'You Lose';

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.casino_outlined),
        title: const Center(
          child: Text('Dice Game'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Total:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              _total.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              resultText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isWin ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              _imagePath,
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dice(value: _dice1),
                Dice(value: _dice2),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _rollDice,
                    child: const Text('Roll'),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _resetDice,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Reset'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _rollDice() {
    final int d1 = Random().nextInt(6) + 1;
    final int d2 = Random().nextInt(6) + 1;
    setState(() {
      _dice1 = d1;
      _dice2 = d2;
      _total = d1 + d2;
      _imagePath = _total >= 10 ? 'assets/images/happy.png' : 'assets/images/sad.png';
    });
  }

  void _resetDice() {
    setState(() {
      _dice1 = 1;
      _dice2 = 1;
      _total = 2;
      _imagePath = 'assets/images/sad.png';
    });
  }
}