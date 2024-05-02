import 'package:flutter/material.dart';
import 'package:oionpricepridiction/beckend/beckend.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../screens/home_screen.dart';

void main() async {
  await Server.fetchMonth();
  await Server.fetchState();
  await Server.fetchVariety();
  await Server.fetchDistrict();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => kdataaa(),
      builder: (context, child) => MaterialApp(
        title: 'ONION PRICE PREDICTION',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            elevatedButtonTheme: elevatedButtonThemeData),
        home: const HomeScreen(),
      ),
    );
  }
}
