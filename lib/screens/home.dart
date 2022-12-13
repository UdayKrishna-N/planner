import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../util/add_task.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                )
              ),
              builder: (context) {
                return AddTask();
              });
        },
        elevation: 5,
        backgroundColor: Colors.black87,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TableCalendar(
                      focusedDay: today,
                      onDaySelected: (DateTime selectedDay, DateTime focusedDay){
                        setState(() {
                          today = selectedDay;
                        });
                      },
                      selectedDayPredicate: (day) => isSameDay(today, day),
                      firstDay: DateTime.utc(2020),
                      lastDay: DateTime.utc(2050),
                      headerVisible: true,
                      calendarFormat: CalendarFormat.month,
                      rowHeight: 45,
                      daysOfWeekHeight: 18,
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                      ),
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xFFF2A776),
                          borderRadius: BorderRadius.circular(10),
                        ),
                          selectedDecoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xFFF2A776),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          defaultDecoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          weekendDecoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          weekendTextStyle: TextStyle(
                            color: Colors.red.shade400,
                            fontSize: 16,
                          ),
                        defaultTextStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: Text(
                  "Priority Tasks",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
