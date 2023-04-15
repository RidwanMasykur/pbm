import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = 0;
  double _weight = 0;
  double _bmi = 0;

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / pow(_height / 100, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI CALCULATOR',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 48.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Height (cm)',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your height';
                }
                return null;
              },
              onChanged: (value) {
                _height = double.parse(value);
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your weight';
                }
                return null;
              },
              onChanged: (value) {
                _weight = double.parse(value);
              },
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                if (_height == 0 || _weight == 0) {
                  return;
                }
                _calculateBMI();
              },
              child: Text('CALCULATE BMI'),
            ),
            SizedBox(height: 24.0),
            _bmi != 0
                ? Text(
                    'Your BMI is ${_bmi.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 24.0),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

