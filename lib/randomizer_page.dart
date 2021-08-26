import 'package:flutter/material.dart';
import 'package:flutter_foundation/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

class RandomizerPage extends StatefulWidget {
  const RandomizerPage({Key? key}) : super(key: key);

  @override
  _RandomizerPageState createState() => _RandomizerPageState();
}

class _RandomizerPageState extends State<RandomizerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer'),
      ),
      body: Center(
        child: Consumer<RandomizerChangeNotifier>(
          builder: (context, notifier, child) {
            return Text(
              notifier.generatedNumer?.toString() ?? 'Generate a number',
              style: TextStyle(fontSize: 40),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<RandomizerChangeNotifier>().generateRandomNumber();
        },
        label: Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
