import 'package:bmicalculater_app/statemangment/cubit.dart';
import 'package:flutter/material.dart';

class WeightAgeContainer extends StatelessWidget {
  const WeightAgeContainer({
    super.key,
    required this.height,
    required this.width,
    required this.textStyle,
    required this.weight,
    required this.age,
    required this.weightdecrimentheroTag,
    required this.weightincreamentheroTag,
    required this.incrementbackgroundColor,
    required this.decrementbackgroundColor,
    required this.incrementicon,
    required this.decrementicon,
    required this.ageincreamentheroTag,
    required this.agedecrimentheroTag,
  });
  final double height;
  final double width;
  final TextStyle textStyle;
  final String weight;
  final String age;
  final String weightdecrimentheroTag;
  final String weightincreamentheroTag;
  final Color incrementbackgroundColor;
  final Color decrementbackgroundColor;
  final IconData incrementicon;
  final IconData decrementicon;
  final String ageincreamentheroTag;
  final String agedecrimentheroTag;
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: BmiCalculaterCubit.get(context).sColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(weight, style: textStyle),
                          Text(
                            BmiCalculaterCubit.get(context).weight.toString(),
                            style: textStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: weightdecrimentheroTag,
                                onPressed: () {
                                  if (BmiCalculaterCubit.get(context).weight <=
                                      5) {
                                    return;
                                  } else {
                                    BmiCalculaterCubit.get(
                                      context,
                                    ).weightchangedecreament();
                                  }
                                },
                                backgroundColor: decrementbackgroundColor,
                                child: Icon(decrementicon),
                              ),
                              const SizedBox(width: 10),
                              FloatingActionButton(
                                heroTag: weightincreamentheroTag,
                                onPressed: () {
                                  BmiCalculaterCubit.get(
                                    context,
                                  ).weightchangeincreament();
                                },
                                backgroundColor: incrementbackgroundColor,
                                child: Icon(incrementicon),
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
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: BmiCalculaterCubit.get(context).sColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(age, style: textStyle),
                          Text(
                            BmiCalculaterCubit.get(context).age.toString(),
                            style: textStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: agedecrimentheroTag,
                                onPressed: () {
                                  if (BmiCalculaterCubit.get(context).age <=
                                      1) {
                                    return;
                                  } else {
                                    BmiCalculaterCubit.get(
                                      context,
                                    ).agechangedecreament();
                                  }
                                },
                                backgroundColor: decrementbackgroundColor,
                                child: Icon(decrementicon),
                              ),
                              const SizedBox(width: 10),
                              FloatingActionButton(
                                heroTag: agedecrimentheroTag,
                                onPressed: () {
                                  BmiCalculaterCubit.get(
                                    context,
                                  ).agechangeincreament();
                                },
                                backgroundColor: incrementbackgroundColor,
                                child: Icon(incrementicon),
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
    );
  }
}
