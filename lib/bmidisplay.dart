import 'package:bmicalculater_app/statemangment/bmi_claculaterstate.dart';
import 'package:bmicalculater_app/statemangment/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiDisplay extends StatelessWidget {
  final double height;
  final String gender;
  final double bmiResult;
  final String bmiStatus;
  const BmiDisplay({
    super.key,
    required this.height,
    required this.gender,
    required this.bmiStatus,
    required this.bmiResult,
  });

  @override
  Widget build(BuildContext context) {
    Color pColor = const Color.fromRGBO(3, 15, 29, 1);
    Color sColor = const Color.fromRGBO(9, 21, 38, 0.9);
    return BlocBuilder<BmiCalculaterCubit, BmiCalculaterState>(
      builder: (context, state) => Scaffold(
        backgroundColor: pColor,
        appBar: AppBar(
          backgroundColor: pColor,
          title: const Center(
            child: Text('BMI Display'),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Card(
                color: sColor,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Height: ${height.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Gender: $gender',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'BMI Result: ${bmiResult.round()}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'BMI Status: $bmiStatus',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
