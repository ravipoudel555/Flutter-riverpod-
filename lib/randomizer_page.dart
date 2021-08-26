import 'package:flutter/material.dart';
import 'package:flutter_foundation/main.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomizerPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final randomizer = watch(randomizerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer'),
      ),
      body: Center(
        child: Text(
          randomizer.generatedNumer?.toString() ?? 'Generate a number',
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read(randomizerProvider).generateRandomNumber();
        },
        label: Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
