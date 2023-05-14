import "package:flutter/material.dart";

abstract class AppTheme {
  static const Color primaryColor = Colors.blueAccent;
  static const Color secondaryColor = Colors.grey;
  static const Color threeColor = Color(0xff3bb3ff);

  static ThemeData theme(BuildContext context) => Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: AppTheme.primaryColor,
            secondary: AppTheme.secondaryColor,
            tertiary: AppTheme.threeColor,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 14, color: Colors.black38),
          bodyMedium: TextStyle(fontSize: 12, color: Colors.black38),
          displayLarge: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black45),
          displayMedium: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black45),
          displaySmall: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black45),
          headlineMedium: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black45),
          headlineSmall: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54),
          titleLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black45),
          titleMedium: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black45),
          titleSmall: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black45),
        ),
      );
}
