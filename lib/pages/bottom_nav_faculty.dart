import 'package:flutter/material.dart';
import 'package:quiz_maker/pages/createquiz.dart';
import 'package:quiz_maker/pages/faculty_home_page.dart';
import 'package:quiz_maker/pages/addquestion.dart';

class bottom_nav_faculty extends StatefulWidget {
  const bottom_nav_faculty({super.key});

  @override
  State<bottom_nav_faculty> createState() => _bottom_nav_facultyState();
}

class _bottom_nav_facultyState extends State<bottom_nav_faculty> {
  @override
  int _selectedIndex = 0;
  @override
  static const List<Widget> _widgetOptions = <Widget>[
    FacultyHomePage(),
    quizcreator(),
    Text(
      'Index 2: Account',
      // style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      // style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 32, 90, 190),
          unselectedItemColor: Color.fromARGB(255, 32, 90, 190),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: "Create",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings")
          ]),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color.fromARGB(255, 15, 82, 182),
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: ((context) => quizcreator())));
      //   },
      // ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
