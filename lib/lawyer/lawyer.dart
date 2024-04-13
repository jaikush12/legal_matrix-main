import 'package:flutter/material.dart';
import 'package:legal_matrix/lawyer/requests.dart';
import 'package:legal_matrix/prisoner/chats.dart';
import './appointment.dart';

class Lawyer extends StatefulWidget {
  const Lawyer({super.key});

  @override
  State<Lawyer> createState() => _LawyerState();
}

class _LawyerState extends State<Lawyer> {
  var _selectedIndex = 2;

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const Appointment();
      
      case 2:
        return RequestsPage();

      case 3: 
        return Chat_Section();
      
      default:
        return Container(); // Return an empty container for unknown index
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.meeting_room),
            backgroundColor: Colors.black,
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            backgroundColor: Colors.black,
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            backgroundColor: Colors.black,
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            backgroundColor: Colors.black,
            label: 'Chats',
          ),
          
          
        ],
      ),
    );
  }
}
