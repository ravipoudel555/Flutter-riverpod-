import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              labelText: 'Minimum',
              intValueSetter: (value) =>
                  context.read(randomizerProvider).min = value,
            ),
            SizedBox(height: 12),
            RangeSelectorTextFormField(
              labelText: 'Maximum',
              intValueSetter: (value) =>
                  context.read(randomizerProvider).max = value,
            )
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null)
          return 'Must be an integer';
        else
          return null;
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
