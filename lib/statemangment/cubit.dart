import 'package:bmicalculater_app/statemangment/bmi_claculaterstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCalculaterCubit extends Cubit<BmiCalculaterState> {
  BmiCalculaterCubit() : super(BmiCalculaterInitial());

  static BmiCalculaterCubit get(context) => BlocProvider.of(context);
  //? The Logic of the Gender
  bool maleisChecked = false;
  bool femaleisChecked = false;
  void malechnage() {
    maleisChecked = true;
    femaleisChecked = false;
    emit(MaleGenderState());
  }

  void femalechange() {
    femaleisChecked = true;
    maleisChecked = false;
    emit(FemaleGenderState());
  }

  //? The Logic of the Height
  double value = 150.0;
  void heightchange(double value) {
    this.value = value;
    emit(HeightState());
  }

  //$ The Logic of the Weight
  double weight = 10;
  weightchangeincreament() {
    weight++;
    emit(WeightState());
  }

   weightchangedecreament() {
     weight--;
    emit(WeightState());
  }

  //* The Logic of the Age
  int age = 1;
   agechangeincreament() {
    age++;
    emit(AgeState());
  }

  agechangedecreament() {
    age--;
    age = age;
    emit(AgeState());
  }

  //? The bacground colors
  Color pColor = const Color.fromRGBO(3, 15, 29, 1);
  Color sColor = const Color.fromRGBO(9, 21, 38, 0.9);
}
