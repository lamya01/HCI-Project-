import 'package:flutter/material.dart';

class LandingTutee extends StatelessWidget {
  final String tuteename = "Tutee";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi $tuteename"),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildCardInfo(
            "Your planned sessions",
            Icons.book,
          ),
          buildCardInfo("Book session by time slot", Icons.calendar_today, () {
            Navigator.pushNamed(context, '/choosetiming');
          }),
          buildCardInfo("Book session by choosing tutor", Icons.person_add, () {
            Navigator.pushNamed(context, '/choosetutor');
          }),
          buildCardInfo(
            "Rate previous sessions",
            Icons.star,
          ),
        ],
      ),
    );
  }

  SizedBox buildCardInfo(text, icondata, [ontapfunc]) {
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
}

class BookChooseTutor extends StatefulWidget {
  @override
  _BookChooseTutorState createState() => _BookChooseTutorState();
}

class _BookChooseTutorState extends State<BookChooseTutor> {
  List<String> timelist = [
    "8 am - 9 am",
    "10 am - 11 am",
    "1 pm - 2:30 pm",
    "5:30 pm - 7 pm",
    "7:30 pm - 8 pm",
    "8:30 pm - 10 pm",
  ];

  List<String> subjects = [
    "OS",
    "CN",
    "ML",
    "HCI",
    "OOMD",
  ];

  String expandedName;
  String selectedTime;
  String selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose tutor",
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              tutorCard("Tanay", timelist, subjects),
              tutorCard("Karan", timelist, subjects),
              tutorCard("Lamya", timelist, subjects),
              tutorCard("Vinay", timelist, subjects),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Confirm', style: TextStyle(fontSize: 24)),
                onPressed: () => {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tutorCard(
      String tutname, List<String> timeslots, List<String> subjects) {
    return Card(
      child: ExpansionTile(
        onExpansionChanged: (value) {
          if (value) {
            setState(() {
              expandedName = tutname;
            });
            print(expandedName);
          }
        },
        title: Row(
          children: [Icon(Icons.person), SizedBox(width: 20), Text(tutname)],
        ),
        children: [
          SizedBox(
            height: 200,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                    child: makeSelectableChips(
                        timeslots, "timeslots", selectedTime, tutname)),
                Flexible(
                    child: makeSelectableChips(
                        subjects, "subjects", selectedSubject, tutname))
              ],
            ),
          )
        ],
      ),
    );
  }

  int selectedVal = -1;

  Widget makeSelectableChips(List<String> textdata, String fieldname,
      String fieldvalue, String tutname) {
    return ListView.builder(
      itemCount: textdata.length,
      itemBuilder: (context, index) {
        return ChoiceChip(
          label: Text(textdata[index]),
          selected: expandedName == tutname && fieldvalue == textdata[index],
          onSelected: (bool selected) {
            if (selected) {
              setState(() {
                if (fieldname == "timeslots")
                  selectedTime = textdata[index];
                else
                  selectedSubject = textdata[index];
              });
            }
          },
        );
      },
    );
  }
}

class BookTiming extends StatefulWidget {
  @override
  _BookTimingState createState() => _BookTimingState();
}

class _BookTimingState extends State<BookTiming> {
  List<String> subjects = [
    "OS",
    "CN",
    "ML",
    "HCI",
    "OOMD",
    "SE",
  ];

  String dropdownvalue;
  TimeOfDay starttime, endtime;

  @override
  void initState() {
    super.initState();
    dropdownvalue = subjects[0];
    starttime = TimeOfDay.now();
    endtime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose timings and subject",
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                timingsInput(context),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text("Choose subject: "),
                    ),
                    DropdownButton(
                      items: subjects.map((String val) {
                        return DropdownMenuItem(
                          child: Text(val),
                          value: val,
                        );
                      }).toList(),
                      value: dropdownvalue,
                      onChanged: (value) {
                        setState(() {
                          dropdownvalue = value;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Confirm', style: TextStyle(fontSize: 24)),
                onPressed: () => {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget timingsInput(BuildContext context) {
    print(TimeOfDay.now().toString());
    return Column(
      children: [
        Row(
          children: [
            Text("Start timing:"),
            SizedBox(width: 30),
            ElevatedButton(
              onPressed: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((TimeOfDay value) {
                  setState(() {
                    starttime = value;
                  });
                });
              },
              child: Text(getTimeAsString(starttime)),
            ),
          ],
        ),
        Row(
          children: [
            Text("End timing:"),
            SizedBox(width: 30),
            ElevatedButton(
              onPressed: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((TimeOfDay value) {
                  setState(() {
                    endtime = value;
                  });
                });
              },
              child: Text(getTimeAsString(endtime)),
            ),
          ],
        ),
      ],
    );
  }

  String getTimeAsString(TimeOfDay time) {
    if (time != null) return "${time.hour}:${time.minute}";
    return "00:00";
  }
}
