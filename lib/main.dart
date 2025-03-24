import 'package:bmicalculater_app/bmicalculater.dart';
import 'package:bmicalculater_app/core/constants/themes.dart';
import 'package:bmicalculater_app/statemangment/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const Expensemain());
}

class Expensemain extends StatelessWidget {
  const Expensemain({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCalculaterCubit(),
      child: MaterialApp(
        //** DarK theme */
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: Themes().kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: Themes().kDarkColorScheme.primaryContainer,
            shadowColor: Themes().kDarkColorScheme.error,
            surfaceTintColor: Themes().kDarkColorScheme.error,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Themes().kDarkColorScheme.primaryContainer,
              foregroundColor: Themes().kDarkColorScheme.onPrimaryContainer,
            ),
          ),
        ),

        //! Use this way to style not from Scratch
        theme: ThemeData().copyWith(
          colorScheme: Themes().kColorscheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: Themes().kColorscheme.primary,
            foregroundColor: Themes().kColorscheme.onPrimary,
          ),
          cardTheme: const CardTheme().copyWith(
            shadowColor: Themes().kColorscheme.error,
            surfaceTintColor: Themes().kColorscheme.error,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Themes().kColorscheme.primaryContainer,
            ),
          ),
        ),
        //? themeMode: ThemeMode.system, (the default)
        home: const BmiCalculater(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
