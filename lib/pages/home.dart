import 'package:flutter/material.dart';
import 'package:globe/pages/tabs/hometab.dart';
import 'package:globe/pages/tabs/profile_tab.dart';
import 'package:globe/pages/tabs/searchtab.dart';

class HomePage extends StatefulWidget {
  int selectedIndex;

   HomePage({Key? key,required this.selectedIndex}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    Search(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(widget.selectedIndex),
      ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,
                color: Colors.black,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined,
                color: Colors.black,),
              label: 'Search',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,
                color: Colors.black,),
              label: 'Profile',
            ),
          ],
          currentIndex: widget.selectedIndex,
          selectedItemColor: Colors.orange,
          onTap: _onItemTapped,
        )
    );
  }
}
