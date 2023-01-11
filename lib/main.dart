import 'package:bmicalc/config.dart';
import 'package:bmicalc/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentTheme.addListener(() {
      print('Changes');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      themeMode: currentTheme.currentTheme(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Home(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // bool isDarkTheme = ref.watch(themeStateNotifierProvider);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'BMI Calculator',
//       // themeMode: isDarkTheme? ThemeMode.dark : ThemeMode.light,
//       // theme: lightTheme,
//       // darkTheme: darkTheme
//       home: Home(),
//     );
//   }
// }
