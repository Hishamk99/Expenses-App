import 'package:expenses_app/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Expenses());
}

var myColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 59, 96, 179),
);
var myDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 59, 96, 179),
);
class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: myColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer
        ),
        cardTheme: const CardTheme().copyWith(
          color: myColorScheme.secondaryContainer,
          margin:const EdgeInsets.symmetric(horizontal: 16 , vertical: 8)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myColorScheme.primaryContainer
          ),
        ),
        bottomSheetTheme:const BottomSheetThemeData().copyWith(
            backgroundColor: myColorScheme.onPrimary,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: myDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer
        ),
        cardTheme: const CardTheme().copyWith(
          color: myDarkColorScheme.secondaryContainer,
          margin:const EdgeInsets.symmetric(horizontal: 16 , vertical: 8)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myDarkColorScheme.primaryContainer
          ),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
