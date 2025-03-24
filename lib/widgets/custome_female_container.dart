import 'package:bmicalculater_app/statemangment/cubit.dart';
import 'package:flutter/material.dart';

class CustomeFemaleContainer extends StatelessWidget {
  const CustomeFemaleContainer({
    required this.female,
    required this.color,
    required this.height,
    required this.textStyle,
    required this.icon,
    required this.iconsize,
    required this.iconcolor,
    this.borderRadius,

    super.key,
  });
  final String female;
  final Color color;
  final double height;
  final BorderRadius? borderRadius;
  final TextStyle textStyle;
  final IconData icon;
  final double iconsize;
  final Color iconcolor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            color:
                BmiCalculaterCubit.get(context).femaleisChecked
                    ? color
                    : BmiCalculaterCubit.get(
                      context,
                    ).sColor, // Change the color based on the checkbox state
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => BmiCalculaterCubit.get(context).femalechange(),
                child: Container(
                  color:
                      BmiCalculaterCubit.get(context).femaleisChecked
                          ? color
                          : BmiCalculaterCubit.get(context).sColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(icon, size: iconsize, color: iconcolor),
                      Text(female, style: textStyle),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
