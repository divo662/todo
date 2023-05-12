import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do/iscompleted.dart';
import 'package:to_do/list.dart';
import 'package:to_do/today.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  List list = List.empty(growable: true);
  String newTask = "";
  String newNote = "";
  String _newUsername = "";
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  late String searchText;

  @override
  void initState() {
    super.initState();
    titleController.addListener(() {
      newTask = titleController.text;
      setState(() {
        searchText = titleController.text;
      });
    });
    noteController.addListener(() {
      newNote = noteController.text;
    });
    controller.addListener(() {
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    noteController.dispose();
    controller.dispose();
    super.dispose();
  }

  void submit() {
    Provider.of<TodoProvider>(context, listen: false).addTask(newTask, newNote);
    Navigator.pop(context);
    titleController.clear();
    noteController.clear();
    controller.clear();
  }

  TextEditingController nameEditor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              showDialog(context: context, builder: (context) {
                return Drawer(
                  child: Drawer(
                    backgroundColor: Colors.white,
                    child: ListView(
                      children: [
                        DrawerHeader(
                          decoration: const BoxDecoration(
                              color: Colors.purple
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 320,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(CupertinoIcons.xmark,
                                      size: 34,
                                      color: Colors.orange,),
                                  ),
                                ],
                              ),
                              const Icon(CupertinoIcons.person,
                                size: 98,),
                            ],
                          ),
                        ),
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 10
                                  )
                              )
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 20,),
                              Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  const Text("Name ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  const SizedBox(width: 20,),
                                  Form(
                                    child: Container(
                                      height: 30,
                                      width: 260,
                                      decoration: const BoxDecoration(
                                          color: Colors.transparent
                                      ),
                                      child: TextFormField(
                                        controller: controller,
                                            onChanged:(value) {
                                          setState(() {
                                            _newUsername = value;
                                          });
                                        },
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 22
                                        ),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: " ${Provider.of<TodoProvider>(context).getUser(_newUsername)}",
                                            hintStyle:  TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold
                                            ),
                                            suffixIcon: GestureDetector(
                                                onTap: () {
                                                  if (_formKey.currentState!.validate()) {
                                                    final newUsername = controller.text;
                                                    Provider.of<TodoProvider>(context, listen: false).getUser(newUsername); // set the new username
                                                    setState(() {}); // update the state to display the new username
                                                  }
                                                },
                                                child: const Icon(
                                                    CupertinoIcons.pencil
                                                )
                                            ),
                                            contentPadding: const EdgeInsets.all(
                                                6)
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25,),
                              const Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Icon(Icons.mobile_friendly,
                                    size: 25,
                                    color: Colors.orange,),
                                  SizedBox(width: 40,),
                                  Text("Invited friends",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),)
                                ],
                              ),
                              const SizedBox(height: 25,),
                              const Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Icon(Icons.info,
                                    size: 27,
                                    color: Colors.red,),
                                  SizedBox(width: 40,),
                                  Text("About us",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),)
                                ],
                              ),
                              const SizedBox(height: 25,),
                              const Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Icon(Icons.download,
                                    size: 29,
                                    color: Colors.green,),
                                  SizedBox(width: 40,),
                                  Text("Update to the latest version",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),)
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: Column(
                            children: [
                              const SizedBox(height: 25,),
                              Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  const Icon(Icons.language_sharp,
                                    size: 27,
                                    color: Colors.purple,),
                                  const SizedBox(width: 40,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      const Text("Language",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                        ),),
                                      Text("English",
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 25,),
                              const Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Icon(Icons.rate_review,
                                    size: 29,
                                    color: Colors.cyan,),
                                  SizedBox(width: 40,),
                                  Text("Rate us",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),),

                                ],
                              ),
                              const SizedBox(height: 25,),
                              const Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Icon(Icons.help_center,
                                    size: 29,
                                    color: Colors.orange,),
                                  SizedBox(width: 40,),
                                  Text("Help",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),),

                                ],
                              ),
                              const SizedBox(height: 35,),
                              const Center(
                                child: Text("Privacy Policy . Terms of Service",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
            },
            child: const Icon(Icons.menu,
              size: 23,
              color: Colors.purple,),
          ),
          title: const Row(
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
            child: Consumer<TodoProvider>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    const SizedBox(height: 3,),
                    Row(
                      children: [
                        const SizedBox(width: 10,),
                        Text("Hey  ${Provider.of<TodoProvider>(context).getUser(_newUsername)}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black
                          ),),
                      ],
                    ),
                    const SizedBox(height: 6,),
                    Row(
                      children: [
                        const SizedBox(width: 28,),
                        Text(DateFormat.yMMMMd().format(DateTime.now()),
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(width: 10,),
                      ],
                    ),
                    const SizedBox(height: 3,),
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Container(
                        height: 50,
                        width: 360,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 5,
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        child: TextField(
                          onChanged:(value){Provider.of<TodoProvider>(context,
                              listen: false)
                              .changeSearchString(value);},
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Find your task...",
                              hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold
                              ),
                              contentPadding: const EdgeInsets.all(10),
                              prefixIcon: const Icon(CupertinoIcons.search,
                                color: Colors.orange,),
                              suffixIcon: GestureDetector(
                                onTap: (){
                                 setState(() {
                                   controller.clear();
                                 });
                                },
                                child: const Icon(
                                  CupertinoIcons.xmark_circle_fill,
                                  color: Colors.red,
                                  size: 23,),
                              )
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),

                    const SizedBox(height: 50,),
                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("My Tasks",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(width: 160,),
                        GestureDetector(
                          onTap: () async {
                            showDialog(context: context, builder: (context) {
                              return Dialog(
                                child: Container(
                                  height: 500,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            const Text("Add Task",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Close",
                                                style: TextStyle(
                                                    color: Colors.deepOrange,
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.bold
                                                ),),)
                                          ],
                                        ),
                                        const SizedBox(height: 27,),
                                        const SizedBox(width: 20,),
                                        const Text("Title",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          ),),
                                        const SizedBox(height: 15,),
                                        Container(
                                          height: 50,
                                          width: 340,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              border: Border.all(
                                                  color: Colors.grey.shade900,
                                                  width: 3)
                                          ),
                                          child: TextField(
                                            controller: titleController,
                                            onSubmitted: (_) => submit(),
                                            textInputAction: TextInputAction.next,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22
                                            ),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter title here",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold
                                                ),
                                                contentPadding: const EdgeInsets
                                                    .all(6)
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 27,),
                                        const Text("Note",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          ),),
                                        const SizedBox(height: 15,),
                                        Container(
                                          height: 120,
                                          width: 340,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              border: Border.all(
                                                  color: Colors.grey.shade900,
                                                  width: 3)
                                          ),
                                          child: TextField(
                                            controller: noteController,
                                            textInputAction: TextInputAction.newline,
                                            onSubmitted: (_) => submit(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter note here",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold
                                                ),

                                                contentPadding: const EdgeInsets
                                                    .all(6)
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 27,),

                                        Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              submit();
                                            },
                                            child: Container(
                                              height: 55,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius: BorderRadius
                                                      .circular(10)
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
                                                          fontWeight: FontWeight
                                                              .bold,
                                                          fontSize: 14
                                                      ),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.add,
                                    size: 20,
                                    color: Colors.white,),
                                  Text("add task",
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
                      ],
                    ),

                    const SizedBox(height: 20,),
                    TabBar(
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.purple,
                      labelColor: Colors.purple,
                      tabs: const [
                        Tab(child: Text("Today", style: TextStyle(
                            fontSize: 16.7,

                            fontWeight: FontWeight.bold
                        ),),),
                        Tab(child: Text("completed", style: TextStyle(
                            fontSize: 16.7,

                            fontWeight: FontWeight.bold
                        ),),)
                      ],
                      controller: tabController,
                      isScrollable: true,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height:MediaQuery.of(context).size.height,
                      child: TabBarView(
                          controller: tabController,
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Container(
                                height:MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child:  Column(
                                  children: [
                                    value.tasks.isEmpty?
                                    const Text("no Task today",
                                        style: TextStyle(
                                          fontSize: 25,
                                        fontWeight: FontWeight.bold)):
                                    const TodayPage()
                                  ],
                                ),
                              ),
                            ),

                            SingleChildScrollView(
                              child: Container(
                                height:MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    value.completedTask.isEmpty?
                                    const Center(
                                      child: Text("no Task completed today",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                    ):
                                    const Completed()
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),

                  ],
                );
              },
            )
        ),
      ),
    );
  }
}



