import 'package:bmicalculater_app/bmicalculater.dart';
import 'package:flutter/material.dart';

var kColorscheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() async {
  runApp(const Expensemain());
}

class Expensemain extends StatelessWidget {
  const Expensemain({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //** DarK theme */

        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.primaryContainer,
            shadowColor: kDarkColorScheme.error,
            surfaceTintColor: kDarkColorScheme.error,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
        ),

        //! Use this way to style not from Scratch
        theme: ThemeData().copyWith(
          colorScheme: kColorscheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorscheme.primary,
            foregroundColor: kColorscheme.onPrimary,
          ),
          cardTheme: const CardTheme().copyWith(
            shadowColor: kColorscheme.error,
            surfaceTintColor: kColorscheme.error,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorscheme.primaryContainer,
            ),
          ),
        ),
        //? themeMode: ThemeMode.system, (the default)
        home: const BmiCalculater(),
        debugShowCheckedModeBanner: false,
      );
  }
}