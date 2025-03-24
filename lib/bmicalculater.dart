import 'package:bmicalculater_app/statemangment/bmi_claculaterstate.dart';
import 'package:bmicalculater_app/statemangment/cubit.dart';
import 'package:bmicalculater_app/widgets/custome_buttom.dart';
import 'package:bmicalculater_app/widgets/custome_slider.dart';
import 'package:bmicalculater_app/widgets/gender_containers.dart';
import 'package:bmicalculater_app/widgets/weight_age_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BmiCalculater extends StatelessWidget {
  const BmiCalculater({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCalculaterCubit(),
      child: BlocConsumer<BmiCalculaterCubit, BmiCalculaterState>(
        listener: (context, state) {},
        builder:
            (context, state) => Scaffold(
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
                  GenderContainers(),
                  //Section 2
                  CustomeSlider(
                    height: "Height",
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textStyle2: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    textStyle3: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    cm: "cm",
                    slideractivecolor: Colors.redAccent,
                    sliderthumbcolor: Colors.redAccent,
                    min: 80,
                    max: 270,
                  ),
                  //Section 3
                  WeightAgeContainer(
                    height: 200,
                    width: 250,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    weight: "weight",
                    age: "age",
                    weightdecrimentheroTag: "weightdecreament",
                    weightincreamentheroTag: "weightincreament",
                    incrementbackgroundColor: Colors.redAccent,
                    decrementbackgroundColor: Colors.redAccent,
                    incrementicon: Icons.add,
                    decrementicon: Icons.remove,
                    ageincreamentheroTag: "ageincreament",
                    agedecrimentheroTag: "agedecriment",
                  ),
                  // ignore: avoid_unnecessary_containers
                  CustomeButtom(
                    color: Colors.redAccent,
                    height: 80,
                    minWidth: double.infinity,
                    title: "Calculate",
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
