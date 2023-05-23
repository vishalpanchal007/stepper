import 'package:flutter/material.dart';
import 'package:stepper_example/stepper_gif.dart';
void main(){
  runApp(gif());
}
class steper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return steperstate();
  }
}

class steperstate extends State<steper> {
  int _currentStep = 0;

  _stepState(int step) {
    if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  _steps() => [
        Step(
          title: const Text('Sign Up'),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(Icons.man),
                  hintText: "Full Name",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Email",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: "Password",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: "Comform Password",
                ),
              ),
            ],
          ),
          state: _stepState(0),
          isActive: _currentStep == 0,
        ),
        Step(
          title: const Text('Login '),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(Icons.man),
                  hintText: "User Name",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: "Password",
                ),
              ),
            ],
          ),
          state: _stepState(1),
          isActive: _currentStep == 1,
        ),
        Step(
          title: const Text('Home'),
          content: const TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                prefixIcon: Icon(Icons.home),
                hintText: "Home"),
          ),
          state: _stepState(2),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stepper App"),
          backgroundColor: Colors.redAccent,
        ),
        body: Stepper(

          controlsBuilder: (BuildContext context, ControlsDetails controls) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent)),
                    onPressed: controls.onStepContinue,
                    child: const Text(
                      'CONTINUE',
                    ),
                  ),
                  if (_currentStep != 3)
                    TextButton(
                      // style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
                      onPressed: controls.onStepCancel,
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                ],
              ),
            );
          },
          onStepTapped: (step) => setState(() => _currentStep = step),
          onStepContinue: () {
            setState(() {
              if (_currentStep < _steps().length - 1) {
                _currentStep += 1;
              } else {
                _currentStep = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (_currentStep > 0) {
                _currentStep -= 1;
              } else {
                _currentStep = 0;
              }
            });
          },
          currentStep: _currentStep,
          steps: _steps(),

        ),
      ),
    );
  }
}
