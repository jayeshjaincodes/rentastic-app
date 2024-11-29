import 'package:flutter/material.dart';
import 'package:rentastic/Screens/productDetilas_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class WorkorderScreen extends StatefulWidget {
  const WorkorderScreen({super.key});

  @override
  State<WorkorderScreen> createState() => _WorkorderScreenState();
}

class _WorkorderScreenState extends State<WorkorderScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.yellow.shade700,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png', 
          height: screenHeight * 0.1,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Text(
              'WORK ORDER',
              style: TextStyle(
                fontSize: screenWidth * 0.07,
                color: Colors.yellow[300],
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.yellow[700],
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.yellow[300],
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: const TextStyle(color: Colors.white),
                weekendTextStyle: const TextStyle(color: Colors.white),
              ),
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                  color: Colors.yellow[300],
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.yellow[300]),
                weekdayStyle: TextStyle(color: Colors.yellow[300]),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildWorkOrderCard(
                    'Work ID_12423', 'Chair-98291, Sofa-87837, Glass table-7627'),
                const SizedBox(height: 10),
                _buildWorkOrderCard(
                    'Work ID_12424', 'Chair-98291, Sofa-87837, Glass table-7627'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkOrderCard(String workId, String details) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen( ),));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.yellow[700],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workId,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              details,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}