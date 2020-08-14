import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_repository/hospital_repository.dart';
import 'package:patient_repository/patient_repository.dart';

import 'app.dart';
import 'simple_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    hospitalRepository: const HospitalRepository(),
    patientRepository: PatientRepository(),
  ));
}