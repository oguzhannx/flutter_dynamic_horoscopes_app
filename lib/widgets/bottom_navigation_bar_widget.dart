// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  PageController pageController;
  int currentIndex;
  var bottomNavigationKey = GlobalKey<_BottomNavigationState>();

  BottomNavigation({
    Key? key,
    required this.pageController,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // int _selectedId = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      unselectedItemColor: Color.fromRGBO(212, 211, 235, 1),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Detay',
          backgroundColor: Color.fromRGBO(59, 55, 188, 0.9),
        ),
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
      currentIndex: widget.currentIndex,
      selectedItemColor: Colors.white,
      onTap: (value) {
        widget.currentIndex = value;
        widget.pageController.jumpToPage(widget.currentIndex);
        print("widget.currentIndex: ${widget.currentIndex}");
        setState(() {});
      },
    );
  }
}
