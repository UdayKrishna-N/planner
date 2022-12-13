import 'package:flutter/material.dart';
import 'package:planner/util/my_button.dart';
import 'package:planner/util/tile.dart';
import 'package:table_calendar/table_calendar.dart';

class AddTask extends StatefulWidget {
  const AddTask({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Divider(
              color: Colors.grey[500],
              thickness: 3,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Add new task",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 24,
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(24),
            ),
            child: TableCalendar(
              focusedDay: today,
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                setState(() {
                  today = selectedDay;
                });
              },
              selectedDayPredicate: (day) => isSameDay(today, day),
              firstDay: DateTime.utc(2020),
              lastDay: DateTime(2050),
              rowHeight: 46,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              calendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xFFF2A776),
                  borderRadius: BorderRadius.circular(10),
                ),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.lightBlue,
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
                  color: Colors.red,
                  fontSize: 16,
                ),
                defaultTextStyle: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(24),
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              maxLines: 4,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontSize: 18, color: Colors.black87),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Write your task here...",
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontSize: 16, color: Colors.black45),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Tile(
            icon: Icons.alarm,
            title: "Task Time",
            data: "4:00 PM",
          ),
          SizedBox(
            height: 15,
          ),
          Tile(
            icon: Icons.notifications_none_rounded,
            title: "Notification",
            data: "In 5 min",
          ),
          SizedBox(
            height: 15,
          ),
          Tile(
            icon: Icons.repeat,
            title: "Repeat",
            data: "No",
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // cancel button
              MyButton(
                buttonText: "Cancel",
                buttonColor: Colors.white,
                textColor: Colors.black87,
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              //  save task button
              MyButton(
                buttonText: "Save Task",
                buttonColor: Colors.black87,
                textColor: Colors.white,
                onTap: (){},
              )
            ],
          ),
        ],
      ),
    );
  }
}


