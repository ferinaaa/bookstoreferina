import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'pages/user.dart';
import 'pages/homepage.dart';
import 'pages/transaction_history.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bookstore',
        //home: Bookstore(),
        home: const MyBottomNavBar()
    );
  }
}

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    TransactionHistoryPage(),
    User()
    // const ListBukuGrid(),
    // const Profile()
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        //buat footer
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,//Color(0xFF393434),
          fixedColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                label: 'Transaction'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile'
            )
          ],
        )
    );
  }
}