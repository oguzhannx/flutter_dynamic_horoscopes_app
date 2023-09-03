import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedId = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      unselectedItemColor: Color.fromRGBO(212, 211, 235, 1),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.today),
          label: 'Günlük',
          backgroundColor: Color.fromRGBO(59, 55, 188, 0.9),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.date_range),
          label: 'Haftalık',
          backgroundColor: Color.fromRGBO(59, 55, 188, 0.9),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Aylık',
          backgroundColor: Color.fromRGBO(59, 55, 188, 0.9),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Yıllık',
          backgroundColor: Color.fromRGBO(59, 55, 188, 0.9),
        ),
      ],
      currentIndex: _selectedId,
      selectedItemColor: Colors.white,
      onTap: (value) {
        _selectedId = value;
        setState(() {});
      },
    );
  }
}
