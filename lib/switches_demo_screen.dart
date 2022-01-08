import 'package:flutter/material.dart';

class SwitchesDemoScreen extends StatefulWidget {
  const SwitchesDemoScreen({Key? key}) : super(key: key);

  @override
  _SwitchesDemoScreenState createState() => _SwitchesDemoScreenState();
}

enum skillLevel { junior, middle, senior }

class _SwitchesDemoScreenState extends State<SwitchesDemoScreen> {
  bool _checked = false;
  bool _confirmAgrement = true;
  skillLevel? _skilllevel = skillLevel.junior;

  void _onCheckedChange(bool? val) {
    setState(() {
      _checked = !_checked;
    });
  }

  void _onSckillLevelChanged(skillLevel? value) {
    setState(() {
      _skilllevel = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            body: Center(
                child: Column(children: [
              Row(
                children: [
                  Checkbox(value: _checked, onChanged: _onCheckedChange),
                  const Text('выбор'),
                ],
              ),
              CheckboxListTile(
                  title: const Text('принять пользовательское соглашение'),
                  value: _confirmAgrement,
                  onChanged: (val) {
                    setState(() {
                      _confirmAgrement = !_confirmAgrement;
                    });
                  }),
              Row(
                children: [
                  Switch(value: _checked, onChanged: _onCheckedChange),
                  const Text('включить'),
                ],
              ),
              SwitchListTile(
                  title: const Text('включить'),
                  value: _checked,
                  onChanged: _onCheckedChange),
              const Text('Уровень навыков'),
              RadioListTile<skillLevel>(
                title: const Text('junior'),
                value: skillLevel.junior,
                groupValue: _skilllevel,
                onChanged: _onSckillLevelChanged,
              ),
              RadioListTile<skillLevel>(
                title: const Text('middle'),
                value: skillLevel.middle,
                groupValue: _skilllevel,
                onChanged: _onSckillLevelChanged,
              ),
              RadioListTile<skillLevel>(
                title: const Text('senior'),
                value: skillLevel.senior,
                groupValue: _skilllevel,
                onChanged: _onSckillLevelChanged,
              ),
            ]))));
  }
}
