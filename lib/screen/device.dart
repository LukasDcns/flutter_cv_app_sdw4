import 'package:flutter/material.dart';

import 'education.dart';
import 'experience.dart';
import 'info.dart';
import 'profil.dart';
import 'skill.dart';

class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreenState createState() => _DeviceScreenState(); 
}

class _DeviceScreenState extends State<DeviceScreen> {
  int _currentScreen = 0;
  final List<Widget> _screenList = [
    ProfilScreen(),
    ExperienceScreen(),
    EducationScreen(),
    SkillScreen(),
    InfoScreen()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lukas Descoins"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: _screenList[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey.shade900,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, color: Colors.white), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline, color: Colors.white), label: 'Expériences'),
          BottomNavigationBarItem(icon: Icon(Icons.school_outlined, color: Colors.white), label: 'Formations'),
          BottomNavigationBarItem(icon: Icon(Icons.verified_outlined, color: Colors.white), label: 'Compétences'),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline, color: Colors.white), label: 'Infos +'),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }
}