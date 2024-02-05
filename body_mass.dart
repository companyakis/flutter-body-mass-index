import 'package:flutter/material.dart';

class BodyMassIndexApp extends StatefulWidget {
  const BodyMassIndexApp({super.key});

  @override
  State<BodyMassIndexApp> createState() => _BodyMassIndexAppState();
}

class _BodyMassIndexAppState extends State<BodyMassIndexApp> {
  
  //body mass index variable
  double bodyMassIndex = 0.0;

  //body mass index function
  void calculateBodyMassIndex() {
    String heightText = heightController.text.trim();
    String weightText = weightController.text.trim();

    try {
      double height = double.parse(heightText);
      double weight = double.parse(weightText);

      setState(() {
        bodyMassIndex = weight / (height * height);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  //text field controllers
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text("Body Mass Index App",
              style: TextStyle(color: Colors.white, fontSize: 20))),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User BMI: ${bodyMassIndex.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 25)),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  label: const Text("Your height (m.)"),
                  suffixText: "m.",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
              controller: heightController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  label: const Text("Your weight (kg.)"),
                  suffixText: "kg.",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
              controller: weightController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent),
                onPressed: calculateBodyMassIndex,
                child: const Text("Calculate",
                    style: TextStyle(fontSize: 20, color: Colors.white))),
          ],
        )),
      ),
    );
  }
}
