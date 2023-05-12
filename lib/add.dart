import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'list.dart';
class AddToCart extends StatelessWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

    );
  }
}

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // final todoList = ToDo.todoList();
  // List<ToDo> _foundToDO = [];
  // final _addyToDoItem = ToDo(title: "t", notes: "",
  //     date: "", startTime: "", endTime: "");

  @override

  void initState(){
    // _foundToDO = todoList;
    super.initState();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String dropValue = "Never";
  final items = [
    "Never",
    "Everyday",
    "Every Monday",
    "Every Tuesday",
    "Every Wednesday",
    "Every Thursday",
    "Every Friday",
    "Every Saturday",
    "Every Sunday",
  ];

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) => const HomePage())
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.purple,)),
        title:  const Row(
          children: [
            SizedBox(width: 283,),
            CircleAvatar(
              backgroundColor: Colors.purple,
              child: Icon(CupertinoIcons.person),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Add Task",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                ],
              ),
              const SizedBox(height: 27,),
              const Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Title",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                ],
              ),
              const SizedBox(height: 15,),
              Container(
                height: 50,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade900,
                  width: 3)
                ),
                child:  TextField(
                  controller: titleController,
                  style:  const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter title here",
                      hintStyle:  TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                      ),

                      contentPadding: const EdgeInsets.all(6)
                  ),
                ),
              ),
              const SizedBox(height: 27,),
              const Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Note",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                ],
              ),
              const SizedBox(height: 15,),
              Container(
                height: 120,
                width: 340,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade900,
                        width: 3)
                ),
                child:  TextField(
                  controller: noteController,
                  style:  const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter note here",
                      hintStyle:  TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                      ),

                      contentPadding: const EdgeInsets.all(6)
                  ),
                ),
              ),
              const SizedBox(height: 27,),
              const Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Date",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                ],
              ),
              const SizedBox(height: 15,),
              Container(
                height: 50,
                width: 340,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade900,
                        width: 3)
                ),
                child:  Row(

                  children: [
                    const SizedBox(width: 16,),
                    Text("${selectedDate.day}.${selectedDate.month}.${selectedDate.year}",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold
                      ),),
                    const SizedBox(width: 168,),
                    GestureDetector(
                        onTap: () async {
                          final DateTime? dateTime= await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2000),
                            lastDate:DateTime(3000),
                          );
                          if (dateTime != null) {
                            setState(() {
                              selectedDate = dateTime;
                            });
                          }
                        },
                      child: const Icon(
                        CupertinoIcons.calendar_badge_plus,
                        color: Colors.yellowAccent,
                      ),
                    )
                  ],
                )
              ),
              const SizedBox(height: 27,),
              const Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Start Time",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(width: 90,),
                  Text("End Time",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 35,),
                  Container(
                      height: 60,
                      width: 164,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade900,
                              width: 3)
                      ),
                    child: Row(
                      children: [
                        const SizedBox(width: 16,),
                        Text("${selectedTime.hour}.${selectedTime.minute}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(width: 48,),
                        GestureDetector(
                          onTap: () async {
                            final TimeOfDay? timeOfDay = await showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                                initialEntryMode: TimePickerEntryMode.dial
                            );
                            if (timeOfDay != null){
                              setState(() {
                                selectedTime = timeOfDay;
                              });
                            }
                          },
                          child: const Icon(
                              CupertinoIcons.clock_solid,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    height: 60,
                    width: 164,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade900,
                            width: 3)
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 16,),
                        Text("${selectTime.hour}.${selectTime.minute}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(width: 48,),
                        GestureDetector(
                          onTap: () async {
                            final TimeOfDay? timeOfDay = await showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                                initialEntryMode: TimePickerEntryMode.dial
                            );
                            if (timeOfDay != null){
                              setState(() {
                                selectedTime = timeOfDay;
                              });
                            }
                          },
                          child: const Icon(
                              CupertinoIcons.clock_fill,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 27,),
              const Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Repeat",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                ],
              ),
              Container(
                height: 50,
                width: 340,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade900,
                        width: 3)
                ),
                child:   DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropValue,
                    dropdownColor: Colors.white,
                    elevation: 4,

                    items: items.map(buildMenuItem).toList(),
                    onChanged: (String? newValue) => setState(() {
                      dropValue = newValue!;
                    }),


                    icon:  Icon(CupertinoIcons.arrow_down_to_line,
                      color: Colors.green,),
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const SizedBox(height: 27,),
         Row(
          children: [
            const SizedBox(width: 250,),
            GestureDetector(
              onTap: (){
              setState(() {
               // todoList.add(_addyToDoItem);
              });
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                        (context) => const HomePage())
                );
              },
              child: Container(
                height: 55,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.add,
                        size: 20,
                        color: Colors.white,),
                      Text("Create Task",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                        ),),
                    ],
                  ),
                ),
              ),
            )
            ])
            ],
          ),
        ),
      ),
    );
  }


  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(
        value: item,
        child: GestureDetector(
          onTap: (){

          },
          child: Text(
            item,
            style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              color: Colors.grey.shade700
            ),
          ),
        ),);

}
