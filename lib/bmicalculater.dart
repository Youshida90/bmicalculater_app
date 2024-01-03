import 'dart:math';

import 'package:bmicalculater_app/bmidisplay.dart';
import 'package:flutter/material.dart';

class BmiCalculater extends StatefulWidget {
  const BmiCalculater({super.key});

  @override
  State<BmiCalculater> createState() => _BmiCalculaterState();
}

class _BmiCalculaterState extends State<BmiCalculater> {
  Color pColor = const Color.fromRGBO(3, 15, 29, 1);
  Color sColor = const Color.fromRGBO(9, 21, 38, 0.9);
  bool _maleisChecked = false;
  bool _femaleisChecked = false;
  double value = 150.0;
  int age = 1;
  double weight = 10;

  double calculateBMI() {
    double height = value / 100; // convert cm to meters
    return weight / pow(height, 2); // BMI calculation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pColor,
      appBar: AppBar(
        backgroundColor: pColor,
        title: const Center(
          child: Text(
            'BMI Calculater',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          //Section 1
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //! Male container
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _maleisChecked
                                ? Colors.redAccent
                                : sColor, // Change the color based on the checkbox state
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => setState(() {
                                  _maleisChecked = true;
                                  _femaleisChecked = false;
                                }),
                                child: Container(
                                  color: _maleisChecked ? Colors.redAccent: sColor,
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.male,
                                        size: 150,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Male",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 35),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //?female container
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _femaleisChecked
                                ? Colors.redAccent
                                : sColor, // Change the color based on the checkbox state
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => setState(() {
                                  _femaleisChecked = true;
                                  _maleisChecked = false;
                                }),
                                child: Container(
                                  color:
                                      _femaleisChecked ? Colors.redAccent : sColor,
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.female,
                                        size: 150,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Female",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 35),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Section 2
          Expanded(
            // ignore: avoid_unnecessary_containers
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: sColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Colors.redAccent,
                      thumbColor: Colors.redAccent,
                      value: value,
                      min: 80,
                      max: 270,
                      onChanged: (double newvalue) {
                        setState(() {
                          value = newvalue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Section 3
          Expanded(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            height: 200,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: sColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Weight",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  weight.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      heroTag: null,
                                      onPressed: () {
                                        if (weight <= 5) {
                                          return;
                                        } else {
                                          setState(() {
                                            weight--;
                                          });
                                        }
                                      },
                                      backgroundColor: Colors.redAccent,
                                      child: const Icon(Icons.remove),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    FloatingActionButton(
                                      heroTag: null,
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      backgroundColor: Colors.redAccent,
                                      child: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            height: 200,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: sColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Age",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  age.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      onPressed: () {
                                        if (age <= 1) {
                                          return;
                                        } else {
                                          setState(() {
                                            age--;
                                          });
                                        }
                                      },
                                      backgroundColor: Colors.redAccent,
                                      child: const Icon(Icons.remove),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      backgroundColor: Colors.redAccent,
                                      child: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
              child: MaterialButton(
            color: Colors.redAccent,
            height: 60.0,
            minWidth: double.infinity,
            onPressed: () {
              double result = calculateBMI();
              double height = value / 100;
              String bmiStatus = "";
              String gender = "";
              if (_maleisChecked == false && _femaleisChecked == false) {
                // show error message
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Invalid input'),
                    content: const Text('Please choose your gender'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                        },
                        child: const Text('Okay'),
                      ),
                    ],
                  ),
                );
                return;
              } else {
                if (age <= 19) {
                  // For children and teenagers
                  if (result < 5) {
                    bmiStatus = "Underweight";
                  } else if (result >= 5 && result < 85) {
                    bmiStatus = "Normal";
                  } else if (result >= 85 && result < 95) {
                    bmiStatus = "Overweight";
                  } else if (result >= 95) {
                    bmiStatus = "Obese";
                  }
                } else {
                  // For adults
                  if (result < 18.5) {
                    bmiStatus = "Underweight";
                  } else if (result >= 18.5 && result <= 24.9) {
                    bmiStatus = "Normal";
                  } else if (result >= 25 && result <= 29.9) {
                    bmiStatus = "Overweight";
                  } else if (result >= 30) {
                    bmiStatus = "Obese";
                  }
                }

                if (_maleisChecked == true) {
                  gender = "Male";
                } else if (_femaleisChecked == true) {
                  gender = "Female";
                }
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BmiDisplay(
                    weight: weight,
                    height: height,
                    gender: gender,
                    bmiStatus: bmiStatus,
                    bmiResult: result,
                    age: age,
                  ),
                ),
              );
            },
            child: const Text(
              "Calculate",
              style: TextStyle(color: Colors.white),
            ),
          ))
        ],
      ),
    );
  }
}
