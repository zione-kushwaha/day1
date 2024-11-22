import 'package:day_1/animation2.dart';
import 'package:flutter/material.dart';
import 'animation0.dart';
import 'animation1.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation day 1'),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.animation_outlined),
            label: 'Animation 1',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.animation_outlined)),
            label: 'Animation 2',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.animation),
            ),
            label: 'Animation 3',
          ),
        ],
      ),
      body: <Widget>[
        RotatingRectangle(),
        const animation1(),
        const animation2(),
      ][currentPageIndex],
    );
  }
}
