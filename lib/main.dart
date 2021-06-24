import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import '/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'AE'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: "The Sans Arabic",
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue,
          brightness: Brightness.light,
          elevation: 0,
          //I want the defaults, which is why I'm copying an 'empty' ThemeData
          //perhaps there's a better way to do this?
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(fontFamily: "The Sans Arabic"),
              bodyText2: TextStyle(fontFamily: "The Sans Arabic"),
              headline3: TextStyle(
                // fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              headline4: TextStyle(
                // fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              headline5: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.lightBlue,
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
      ),
      home: TabsScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (ctx) => CategoriesScreen(),
      //   CategoryTripsScreen.screenRoute: (ctx) => CategoryTripsScreen(),
      // },
    );
  }
}
