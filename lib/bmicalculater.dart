import 'dart:math';

import 'package:bmicalculater_app/bmidisplay.dart';
import 'package:bmicalculater_app/statemangment/bmi_claculaterstate.dart';
import 'package:bmicalculater_app/statemangment/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BmiCalculater extends StatelessWidget {
  const BmiCalculater({super.key});
  @override
  Widget build(BuildContext context) {
    //^ The Logic of the Bmi Result
    double calculateBMI() {
      double height =
          BmiCalculaterCubit.get(context).value / 100; // convert cm to meters
      return BmiCalculaterCubit.get(context).weight /
          pow(height, 2); // BMI calculation
    }
    return BlocProvider(
      create: (context) => BmiCalculaterCubit(),
      child: BlocConsumer<BmiCalculaterCubit, BmiCalculaterState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          backgroundColor: BmiCalculaterCubit.get(context).pColor,
          appBar: AppBar(
            backgroundColor: BmiCalculaterCubit.get(context).pColor,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: BmiCalculaterCubit.get(context)
                                        .maleisChecked
                                    ? Colors.redAccent
                                    : BmiCalculaterCubit.get(context)
                                        .sColor, // Change the color based on the checkbox state
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => BmiCalculaterCubit.get(context)
                                        .malechnage(),
                                    child: Container(
                                      color: BmiCalculaterCubit.get(context)
                                              .maleisChecked
                                          ? Colors.redAccent
                                          : BmiCalculaterCubit.get(context)
                                              .sColor,
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.male,
                                            size: 120,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Male",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 35),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: BmiCalculaterCubit.get(context)
                                        .femaleisChecked
                                    ? Colors.redAccent
                                    : BmiCalculaterCubit.get(context)
                                        .sColor, // Change the color based on the checkbox state
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => BmiCalculaterCubit.get(context)
                                        .femalechange(),
                                    child: Container(
                                      color: BmiCalculaterCubit.get(context)
                                              .femaleisChecked
                                          ? Colors.redAccent
                                          : BmiCalculaterCubit.get(context)
                                              .sColor,
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.female,
                                            size: 120,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Female",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 35),
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
                      color: BmiCalculaterCubit.get(context).sColor,
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
                              BmiCalculaterCubit.get(context)
                                  .value
                                  .toInt()
                                  .toString(),
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
                          value: BmiCalculaterCubit.get(context).value,
                          min: 80,
                          max: 270,
                          onChanged: (double newvalue) {
                            BmiCalculaterCubit.get(context)
                                .heightchange(newvalue);
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: BmiCalculaterCubit.get(context).sColor,
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
                                      BmiCalculaterCubit.get(context)
                                          .weight
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FloatingActionButton(
                                          heroTag: "weightdecreament",
                                          onPressed: () {
                                            if (BmiCalculaterCubit.get(context)
                                                    .weight <=
                                                5) {
                                              return;
                                            } else {
                                              BmiCalculaterCubit.get(context)
                                                  .weightchangedecreament();
                                            }
                                          },
                                          backgroundColor: Colors.redAccent,
                                          child: const Icon(Icons.remove),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        FloatingActionButton(
                                          heroTag: "weightincreament",
                                          onPressed: () {
                                            BmiCalculaterCubit.get(context)
                                                .weightchangeincreament();
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: BmiCalculaterCubit.get(context).sColor,
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
                                      BmiCalculaterCubit.get(context)
                                          .age
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FloatingActionButton(
                                          heroTag: "Agedecreament",
                                          onPressed: () {
                                            if (BmiCalculaterCubit.get(context)
                                                    .age <=
                                                1) {
                                              return;
                                            } else {
                                              BmiCalculaterCubit.get(context)
                                                  .agechangedecreament();
                                            }
                                          },
                                          backgroundColor: Colors.redAccent,
                                          child: const Icon(Icons.remove),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        FloatingActionButton(
                                          heroTag: "Ageincreament",
                                          onPressed: () {
                                            BmiCalculaterCubit.get(context)
                                                .agechangeincreament();
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
                  double height = BmiCalculaterCubit.get(context).value / 100;
                  String bmiStatus = "";
                  String gender = "";
                  if (BmiCalculaterCubit.get(context).maleisChecked == false &&
                      BmiCalculaterCubit.get(context).femaleisChecked ==
                          false) {
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
                    if (BmiCalculaterCubit.get(context).age <= 19) {
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

                    if (BmiCalculaterCubit.get(context).maleisChecked == true) {
                      gender = "Male";
                    } else if (BmiCalculaterCubit.get(context)
                            .femaleisChecked ==
                        true) {
                      gender = "Female";
                    }
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiDisplay(
                        height: height,
                        gender: gender,
                        bmiStatus: bmiStatus,
                        bmiResult: result,
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
        ),
      ),
    );
  }
}
