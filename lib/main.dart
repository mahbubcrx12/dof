import 'package:dof_agein/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/notice_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoticeProvider()),
        // ChangeNotifierProvider(create: (context) => DivisionProvider()),
        // ChangeNotifierProvider(create: (context)=>DistrictProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: SplashScreen()
      ),
    );
  }
}
