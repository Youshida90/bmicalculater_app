import 'package:bmicalculater_app/widgets/custome_female_container.dart';
import 'package:bmicalculater_app/widgets/custome_male_container.dart';
import 'package:flutter/material.dart';

class GenderContainers extends StatelessWidget {
  const GenderContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //! Male container
              CustomeMaleContainer(
                male: "Male",
                color: Colors.redAccent,
                height: 200,
                textStyle: TextStyle(color: Colors.white, fontSize: 35),
                icon: Icons.male,
                iconcolor: Colors.white,
                iconsize: 120,
              ),
              const SizedBox(width: 20),
              //?female container
              CustomeFemaleContainer(
                female: "Female",
                color: Colors.redAccent,
                height: 200,
                textStyle: TextStyle(color: Colors.white, fontSize: 35),
                icon: Icons.female,
                iconcolor: Colors.white,
                iconsize: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
