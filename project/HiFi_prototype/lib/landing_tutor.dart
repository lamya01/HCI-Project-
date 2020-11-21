import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overlay_support/overlay_support.dart';

class LandingTutor extends StatefulWidget {
  @override
  _LandingTutorState createState() => _LandingTutorState();
}

class TuteeSlotInfo {
  TuteeSlotInfo(this.name, this.timeslot, this.subject);

  String name;
  String timeslot;
  String subject;
}

class _LandingTutorState extends State<LandingTutor> {
  @override
  void initState() {
    super.initState();
  }

  final String tutorname = "Tutor";

  List<String> freeTimings = [];
  List<TuteeSlotInfo> slotInfo = [
    TuteeSlotInfo('Tanay', '1 pm - 2pm', 'OOMD'),
    TuteeSlotInfo('Lamya', '3 pm - 4 pm', 'AIR'),
    TuteeSlotInfo('Vinay', '6 pm - 8 pm', 'AIR'),
  ];
  List<String> expSubjects = [
    "OOMD",
    "HCI",
    "HCI",
    "HCI",
    "HCI",
    "HCI",
    "HCI",
    "HCI",
    "AIR"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi $tutorname"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildCardInfo(
              "Your planned sessions with tutees",
              Icons.book,
              () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: SizedBox(
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text('Your upcoming planned sessions'),
                                SingleChildScrollView(
                                  child: DataTable(
                                    columnSpacing: 20,
                                    columns: [
                                      DataColumn(label: Text('Tutee-name')),
                                      DataColumn(label: Text('Time-slot')),
                                      DataColumn(label: Text('Subject')),
                                    ],
                                    rows: slotInfo.map((TuteeSlotInfo info) {
                                      return DataRow(cells: [
                                        DataCell(Text(info.name)),
                                        DataCell(Text(info.timeslot)),
                                        DataCell(Text(info.subject)),
                                      ]);
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
            buildCardInfo(
              "Set free schedule for today",
              Icons.calendar_today,
              () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, setState) {
                          return Dialog(
                            child: SizedBox(
                              height: 300,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Your free slots'),
                                        Spacer(),
                                        IconButton(
                                            color: Colors.blue,
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              askForStartAndEndTime(
                                                  context, setState);
                                            }),
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      child: DataTable(
                                        columnSpacing: 20,
                                        columns: [
                                          DataColumn(label: Text('Time-slot')),
                                        ],
                                        rows: freeTimings.map((String info) {
                                          return DataRow(cells: [
                                            DataCell(Text(info)),
                                          ]);
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    });
              },
            ),
            buildCardInfo("Set subjects of expertise", Icons.person_add, () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return Dialog(
                          child: SizedBox(
                            height: 300,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Your current subjects:'),
                                      Spacer(),
                                      IconButton(
                                          color: Colors.blue,
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            askForNewSubjects(
                                                context, setState);
                                          }),
                                    ],
                                  ),
                                  SingleChildScrollView(
                                    child: Wrap(
                                      children:
                                          expSubjects.map((String subject) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: ActionChip(
                                            label: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(subject),
                                                Icon(Icons.close)
                                              ],
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                expSubjects.remove(subject);
                                              });
                                            },
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  });
            }),
            buildCardInfo(
              "Rate previous sessions",
              Icons.star,
            ),
            buildCardInfo("Link UPI/Bank Accounts", Icons.money),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          shownotif();
        },
      ),
    );
  }

  SizedBox buildCardInfo(String text, IconData icondata, [ontapfunc]) {
    return SizedBox(
      height: 150,
      child: Card(
        child: InkWell(
          onTap: ontapfunc,
          child: ListTile(
            leading: Icon(icondata),
            title: Text(text),
          ),
        ),
      ),
    );
  }

  void shownotif() {
    showOverlayNotification((context) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: SafeArea(
          child: ListTile(
            title: Text("You have a new session request"),
            subtitle: Column(
              children: [
                Text("Tuteename - Subject - Timeslot"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Confirm: "),
                    IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          OverlaySupportEntry.of(context).dismiss();
                        }),
                    Text("Cancel: "),
                    IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          OverlaySupportEntry.of(context).dismiss();
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }, duration: Duration.zero);
  }

  void askForStartAndEndTime(BuildContext context, setState) async {
    TimeOfDay starttime = await showTimePicker(
      helpText: 'Pick start time',
      context: context,
      initialTime: TimeOfDay.now(),
    );
    TimeOfDay endtime = await showTimePicker(
      helpText: 'Pick end time',
      context: context,
      initialTime:
          TimeOfDay.fromDateTime(DateTime.now().add(Duration(hours: 2))),
    );

    setState(() {
      freeTimings
          .add("${starttime.format(context)} - ${endtime.format(context)}");
    });
  }

  void askForNewSubjects(BuildContext context, setState) async {
    TextEditingController _controller = new TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: SizedBox(
              height: 130,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration:
                          InputDecoration(hintText: 'Enter your subject'),
                    ),
                    ElevatedButton(
                      child: Text("Add"),
                      onPressed: () {
                        setState(() {
                          expSubjects.add(_controller.text);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
