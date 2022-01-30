import 'package:flutter/material.dart';

class ParametersScreen extends StatelessWidget {
  const ParametersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Your data"),
              Spacer(),
              Row(
                children: [
                  Text("Weight"),
                  Spacer(),
                  Text("82"),
                  Icon(Icons.edit),
                ],
              ),
              Row(
                children: [
                  Text("Pullups"),
                  Spacer(),
                  Text("12"),
                  Icon(Icons.edit),
                ],
              ),
              Row(
                children: [
                  Text("Type"),
                  Spacer(),
                  Text("Endurance"),
                  Icon(Icons.edit),
                ],
              ),
              Spacer(),
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
