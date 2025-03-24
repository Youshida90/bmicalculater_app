import 'dart:math';

import 'package:bmicalculater_app/bmidisplay.dart';
import 'package:bmicalculater_app/statemangment/cubit.dart';
import 'package:flutter/material.dart';

class CustomeButtom extends StatelessWidget {
  const CustomeButtom({
    super.key,
    required this.color,
    required this.height,
    required this.minWidth,
    required this.title,
    required this.textStyle,
  });
  final Color color;
  final double height;
  final double minWidth;
  final String title;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      height: height,
      minWidth: minWidth,
      onPressed: () {
        double height = BmiCalculaterCubit.get(context).value / 100;
        double result = BmiCalculaterCubit.get(context).weight / pow(height, 2);
        String bmiStatus = "";
        String gender = "";
        int age = BmiCalculaterCubit.get(context).age;
        double weight = BmiCalculaterCubit.get(context).weight;
        if (BmiCalculaterCubit.get(context).maleisChecked == false &&
            BmiCalculaterCubit.get(context).femaleisChecked == false) {
          // show error message
          showDialog(
            context: context,
            builder:
                (ctx) => AlertDialog(
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
          } else if (BmiCalculaterCubit.get(context).femaleisChecked == true) {
            gender = "Female";
          }
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => BmiDisplay(
                  height: height,
                  gender: gender,
                  bmiStatus: bmiStatus,
                  bmiResult: result,
                  weight: weight,
                  age: age,
                ),
          ),
        );
      },
      child: Text(title, style: textStyle),
    );
  }
}
