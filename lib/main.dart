import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screen/device.dart';

Future main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(CvApp());
}

class CvApp extends StatefulWidget {
  @override
  _CvAppState createState() => _CvAppState();
}

class _CvAppState extends State<CvApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV Lukas',
      theme: ThemeData(
          fontFamily: 'Raleway-Regular',
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.blueGrey.shade800
      ),
      home: DeviceScreen(),
    );
  }
}