import 'package:flutter/material.dart';
import 'package:legal_matrix/prisoner/articles.dart';
import 'package:legal_matrix/prisoner/chats.dart';
import 'package:legal_matrix/prisoner/dashboard.dart';
import 'package:legal_matrix/prisoner/directory.dart';
import 'package:legal_matrix/prisoner/rehabilitation.dart';

class Prisoner extends StatefulWidget {
  @override
  _PrisonerState createState() => _PrisonerState();
}

class _PrisonerState extends State<Prisoner> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            backgroundColor: Colors.black,
            label: 'Rehabilitation Program',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            backgroundColor: Colors.black,
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            backgroundColor: Colors.black,
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            backgroundColor: Colors.black,
            label: 'Legal Directory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            backgroundColor: Colors.black,
            label: 'Legal Articles',
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const Rehabulutation_Page();
      case 1:
        return const Chat_Section();
      case 2:
        return const DashboardPage();
      case 3:
        return const Legal_Directory();
      case 4:
        return Artiles_page();
      default:
        return Container(); // Return an empty container for unknown index
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}