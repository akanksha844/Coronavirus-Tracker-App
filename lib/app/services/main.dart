import 'dart:html';

import 'package:flutter/material.dart';

void main() async {
  Intl.deafultLocale = 'en_GB';
  await initializeDataFormatting();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @requirde this.sharedPreferences}) : super(key: key);
  final SharedPreferences sharedPreferences;

  @Override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(
          apiService: APIService(API.sandbox()),
          dataCacheService: DataCacheService(
              sharedPreferences: SharedPreferences.getInstance())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coronavirus Tracker',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF101010),
          cardColor: Color(0xFF222222),
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
