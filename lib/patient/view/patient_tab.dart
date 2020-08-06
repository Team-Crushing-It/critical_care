import 'package:criticalcare/patient/patient.dart';
import 'package:flutter/material.dart';

class PatientTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RoomSelection(),
            // PatientProfile(),
            // ...
          ],
        ),
      ),
    );
  }
}
