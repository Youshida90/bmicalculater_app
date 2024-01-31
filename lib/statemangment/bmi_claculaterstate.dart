abstract class BmiCalculaterState {}

//! Intial State
class BmiCalculaterInitial extends BmiCalculaterState {}

//@ The MaleGenderState
class MaleGenderState extends BmiCalculaterState {}

//# The FemaleGenderState
class FemaleGenderState extends BmiCalculaterState {}

//$ The HeightincreamentState
class HeightState extends BmiCalculaterState {}

//% The WeightState
class WeightState extends BmiCalculaterState {}

//& The AgeState
class AgeState extends BmiCalculaterState {}

//@ The BmiCalculaterresultState
class BmiCalculaterresultState extends BmiCalculaterState {}
