import 'package:patient_repository/patient_repository.dart';

/// important stuff
PatientProfileModel getPatientProfile(String patientId) {
  return _fakePatientsProfile[patientId];
}

final _fakePatientsProfile = <String, PatientProfileModel>{
  'patient-0': PatientProfileModel(
    name: 'Juan Alvaro',
    age: 41,
    dateOfBirth: DateTime(1979, 12, 03),
    race: Race.latino,
    language: 'Spanish',
    gender: Gender.male,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/715724285389308085/740723011249766550/unknown.png',
  ),
  'patient-1': PatientProfileModel(
    name: 'Bruce Lee',
    age: 104,
    dateOfBirth: DateTime(1916, 1, 03),
    race: Race.asian,
    language: 'Catonese',
    gender: Gender.male,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/703406022953533552/741451483698167828/unknown.png',
  ),
  'patient-2': PatientProfileModel(
    name: 'Julia Roberts',
    age: 41,
    dateOfBirth: DateTime(1979, 4, 22),
    race: Race.white,
    language: 'English',
    gender: Gender.female,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/703406022953533552/741451538647613460/unknown.png',
  ),
  'patient-3': PatientProfileModel(
    name: 'Al Capone',
    age: 4,
    dateOfBirth: DateTime(2015, 11, 15),
    race: Race.white,
    language: 'Italian',
    gender: Gender.male,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/715724285389308085/740723011249766550/unknown.png',
  ),
  'patient-4': PatientProfileModel(
    name: 'Jed Bartlett',
    age: 69,
    dateOfBirth: DateTime(1951, 1, 12),
    race: Race.white,
    language: 'English',
    gender: Gender.male,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/703406022953533552/741451483698167828/unknown.png',
  ),
  'patient-5': PatientProfileModel(
    name: 'Joey Montana',
    age: 31,
    dateOfBirth: DateTime(1989, 1, 03),
    race: Race.latino,
    language: 'Spanish',
    gender: Gender.female,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/703406022953533552/741451538647613460/unknown.png',
  ),'patient-6': PatientProfileModel(
    name: 'Juan Alvaro',
    age: 41,
    dateOfBirth: DateTime(1979, 12, 03),
    race: Race.latino,
    language: 'Spanish',
    gender: Gender.male,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/715724285389308085/740723011249766550/unknown.png',
  ),
  'patient-7': PatientProfileModel(
    name: 'Bruce Lee',
    age: 104,
    dateOfBirth: DateTime(1916, 1, 03),
    race: Race.asian,
    language: 'Catonese',
    gender: Gender.male,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/703406022953533552/741451483698167828/unknown.png',
  ),
  'patient-8': PatientProfileModel(
    name: 'Julia Roberts',
    age: 41,
    dateOfBirth: DateTime(1979, 4, 22),
    race: Race.white,
    language: 'English',
    gender: Gender.female,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/703406022953533552/741451538647613460/unknown.png',
  ),
  'patient-9': PatientProfileModel(
    name: 'Al Capone',
    age: 4,
    dateOfBirth: DateTime(2015, 11, 15),
    race: Race.white,
    language: 'Italian',
    gender: Gender.male,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/715724285389308085/740723011249766550/unknown.png',
  ),
  'patient-10': PatientProfileModel(
    name: 'Jed Bartlett',
    age: 69,
    dateOfBirth: DateTime(1951, 1, 12),
    race: Race.white,
    language: 'English',
    gender: Gender.male,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/703406022953533552/741451483698167828/unknown.png',
  ),
  'patient-11': PatientProfileModel(
    name: 'Joey Montana',
    age: 31,
    dateOfBirth: DateTime(1989, 1, 03),
    race: Race.latino,
    language: 'Spanish',
    gender: Gender.female,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/703406022953533552/741451538647613460/unknown.png',
  ),
  'patient-12': PatientProfileModel(
    name: 'Albert Einstein',
    age: 115,
    dateOfBirth: DateTime(1905, 1, 03),
    race: Race.white,
    language: 'German',
    gender: Gender.male,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
       'https://cdn.discordapp.com/attachments/703406022953533552/741451483698167828/unknown.png',
  ),
};
