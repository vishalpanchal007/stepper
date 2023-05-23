import 'package:flutter/material.dart';

void main() {
  runApp(gif());
}

class gif extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return gifstate();
  }
}

class gifstate extends State<gif> {
  int _curruntStep = 0;

  _stepState(int Step) {
    if (_curruntStep > Step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  static List<Step> a = [
    Step(
      isActive: true,
      title: Text("Profile Name"),
      content: Column(
        children: [
          TextField(),
        ],
      ),
    ),
    Step(
      isActive: true,
      title: Text("Name"),
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "name",
            ),
          ),
        ],
      ),
    ),
    Step(
      isActive: true,
      title: Text("Phone"),
      content: Column(
        children: [
          TextField(),
        ],
      ),
    ),
    Step(
      isActive: true,
      title: Text("Email",),
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.email_outlined),
            ),
          ),
        ],
      ),
    ),
    Step(
      isActive: true,
      title: Text("DOB"),
      content: Column(
        children: [
          TextField(),
        ],
      ),
    ),
    Step(
      isActive: true,
      title: Text("Gender"),
      content: Column(
        children: [
          TextField(),
        ],
      ),
    ),
    Step(
      isActive: true,
      title: Text("Current Location"),
      content: Column(
        children: [
          TextField(),
        ],
      ),
    ),
    Step(
       isActive: true,
      title: Text("nationalities"),
      content: Column(
        children: [
          TextField(),
        ],
      ),
    ),
    Step(
      isActive: true,
      title: Text("Religion"),
      content: Column(
        children: [
          TextField(
             decoration: InputDecoration(
               hintText: "xyz.etc",
               icon: Icon(Icons.language),
             ),
          ),
        ],
      ),
    ),
    Step(
       isActive: true,
      title: Text(" Language(S)"),
      content: Column(
        children: [
          TextField(),
        ],
      ),
    ),
    Step(
      isActive: true,
      title: Text("Biography"),
      content: Column(
        children: [
          TextField(),
        ],
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_sharp,
          size: 30),
          title: Text("Edit your Profile"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.blue, Colors.greenAccent])),
          ),
        ),
        body: Theme(data: ThemeData(
          primaryColor: Colors.red,
          colorScheme:Theme.of(context).colorScheme.copyWith(
            onSurface: Colors.blue
          ),

        ),
          child: Stepper(
            onStepTapped: (step) => setState(() => _curruntStep = step),
            onStepContinue: () {
              setState(() {
                if (_curruntStep < a.length - 1) {
                  _curruntStep += 1;
                } else {
                  _curruntStep = 0;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (_curruntStep > 0) {
                  _curruntStep -= 1;
                } else {
                  _curruntStep = 0;
                }
              });
            },
            currentStep: _curruntStep,
            steps: a,
          ),
        ),
      ),
    );
  }
}
