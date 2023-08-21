import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class LanguagesFlagWidget extends StatelessWidget {
  const LanguagesFlagWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircleFlag(
            Hive.box('language').get('language') == 'azerbaijan' ? 'az' : 'us'),
      ),
    );
  }
}
