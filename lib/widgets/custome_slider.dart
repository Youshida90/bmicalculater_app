import 'package:bmicalculater_app/statemangment/cubit.dart';
import 'package:flutter/material.dart';

class CustomeSlider extends StatelessWidget {
  const CustomeSlider({
    required this.height,
    required this.textStyle,
    required this.textStyle2,
    required this.textStyle3,
    required this.cm,
    required this.slideractivecolor,
    required this.sliderthumbcolor,
    required this.min,
    required this.max,
    super.key,
  });
  final String height;
  final TextStyle textStyle;
  final TextStyle textStyle2;
  final TextStyle textStyle3;
  final String cm;
  final Color slideractivecolor;
  final Color sliderthumbcolor;
  final double min;
  final double max;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              Text(height, style: textStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    BmiCalculaterCubit.get(context).value.toInt().toString(),
                    style: textStyle2,
                  ),
                  Text(cm, style: textStyle3),
                ],
              ),
              Slider(
                activeColor: slideractivecolor,
                thumbColor: sliderthumbcolor,
                value: BmiCalculaterCubit.get(context).value,
                min: min,
                max: max,
                onChanged: (double newvalue) {
                  BmiCalculaterCubit.get(context).heightchange(newvalue);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
