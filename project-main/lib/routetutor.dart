import 'package:flutter/material.dart';
import 'package:luk_to_learn/Screens/hometutor.dart';
import 'package:luk_to_learn/Screens/mycoursetutor.dart';

const TextStyle _textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class RouteTutorScreen extends StatefulWidget {
  const RouteTutorScreen({Key? key}) : super(key: key);

  @override
  State<RouteTutorScreen> createState() => _RouteTutorScreenState();
}

class _RouteTutorScreenState extends State<RouteTutorScreen> {
  int _currentIndex = 0;
  List<Widget> pages = const [
    HomeTutor(),
    Text('search', style: _textStyle),
    MycouseTutor(),
    Text('person', style: _textStyle),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            print(newIndex);
            _currentIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search_off_outlined),
            icon: Icon(Icons.search_outlined),
            label: 'search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.video_camera_back),
            icon: Icon(Icons.video_camera_back_outlined),
            label: 'my courses',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
            label: 'person',
          ),
        ],
      ),
      body: Center(
        child: pages[_currentIndex],
      ),
    );
  }
}
