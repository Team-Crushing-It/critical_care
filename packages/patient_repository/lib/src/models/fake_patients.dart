import 'package:patient_repository/patient_repository.dart';

/// important stuff
PatientProfileModel getPatientProfile(String patientId) {
  return _fakePatientsProfile[patientId];
}

/// important stuff
List<PatientRecordsModel> getPatientRecords(String patientId) {
  return _fakePatientRecords[patientId];
}

final _fakePatientRecords = <String, List<PatientRecordsModel>>{
  'patient-0': [
    const PatientRecordsModel(
      type: 'Allergies',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Albuterol HFA 90mcg',
      status: 'Ordered',
    ),
    const PatientRecordsModel(
      type: 'Immunizations',
      info: 'COVID-19',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Lab Results',
      info: 'HDL Cholesterol 53.5',
      status: 'Recorded',
    ),
  ],
  'patient-1': [
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Albuterol HFA 90mcg',
      status: 'Ordered',
    ),
    const PatientRecordsModel(
      type: 'Allergies',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Immunizations',
      info: 'COVID-19',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Lab Results',
      info: 'HDL Cholesterol 53.5',
      status: 'Recorded',
    ),
  ],
  'patient-2': [
    const PatientRecordsModel(
      type: 'Immunizations',
      info: 'COVID-19',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Immunizations',
      info: 'COVID-19',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
  ],
  'patient-3': [
    const PatientRecordsModel(
      type: 'Immunizations',
      info: 'COVID-19',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Lab Results',
      info: 'HDL Cholesterol 53.5',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
  ],

  'patient-4': [
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Immunizations',
      info: 'COVID-19',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Lab Results',
      info: 'HDL Cholesterol 53.5',
      status: 'Recorded',
    ),
  ],
  'patient-5': [
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
  ],
  'patient-6': [
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
  ],
  'patient-7': [
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
  ],
  'patient-8': [
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
  ],
  'patient-9': [
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
  ],
  'patient-10': [
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
  ],
  'patient-11': [
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
  ],
  'patient-12': [
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
    const PatientRecordsModel(
      type: 'Medications',
      info: 'Peanut Allergy',
      status: 'Recorded',
    ),
  ],
  // PatientRecordsModel(
  //   type: 'Medications',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
  // 'patient-1': const PatientRecordsModel(
  //   type: 'Allergies',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
  // 'patient-2': const PatientRecordsModel(
  //   type: 'Allergies',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
  // 'patient-3': const PatientRecordsModel(
  //   type: 'Allergies',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
  // 'patient-4': const PatientRecordsModel(
  //   type: 'Allergies',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
  //  'patient-5': const PatientRecordsModel(
  //   type: 'Allergies',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
  // 'patient-6': const PatientRecordsModel(
  //   type: 'Allergies',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
  // 'patient-7': const PatientRecordsModel(
  //   type: 'Allergies',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
  // 'patient-8': const PatientRecordsModel(
  //   type: 'Allergies',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
  // 'patient-9': const PatientRecordsModel(
  //   type: 'Allergies',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
  // 'patient-10': const PatientRecordsModel(
  //   type: 'Allergies',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
  // 'patient-11': const PatientRecordsModel(
  //   type: 'Allergies',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
  // 'patient-12': const PatientRecordsModel(
  //   type: 'Allergies',
  //   info: 'Peanut Allergy',
  //   status: 'Recorded',
  // ),
};

//=====================================================

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
        'https://cdn.discordapp.com/attachments/703406022953533552/743094210181464074/tenor_1.gif',
  ),
  'patient-1': PatientProfileModel(
    name: 'Bruce Lee',
    age: 104,
    dateOfBirth: DateTime(1916, 1, 03),
    race: Race.asian,
    language: 'Cantonese',
    gender: Gender.male,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/703406022953533552/743094346697539685/joey.gif',
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
        'https://cdn.discordapp.com/attachments/703406022953533552/743094479829073920/girl.gif',
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
        'https://cdn.discordapp.com/attachments/703406022953533552/743094210181464074/tenor_1.gif',
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
        'https://cdn.discordapp.com/attachments/703406022953533552/743094346697539685/joey.gif',
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
        'https://cdn.discordapp.com/attachments/703406022953533552/743094479829073920/girl.gif',
  ),
  'patient-6': PatientProfileModel(
    name: 'Juan Alvaro',
    age: 41,
    dateOfBirth: DateTime(1979, 12, 03),
    race: Race.latino,
    language: 'Spanish',
    gender: Gender.male,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/703406022953533552/743094210181464074/tenor_1.gif',
  ),
  'patient-7': PatientProfileModel(
    name: 'Bruce Lee',
    age: 104,
    dateOfBirth: DateTime(1916, 1, 03),
    race: Race.asian,
    language: 'Cantonese',
    gender: Gender.male,
    primaryCareDoctorId: 'doctor-0',
    photoUrl:
        'https://cdn.discordapp.com/attachments/703406022953533552/743094346697539685/joey.gif',
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
        'https://cdn.discordapp.com/attachments/703406022953533552/743094479829073920/girl.gif',
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
        'https://cdn.discordapp.com/attachments/703406022953533552/743094210181464074/tenor_1.gif',
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
        'https://cdn.discordapp.com/attachments/703406022953533552/743094346697539685/joey.gif',
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
        'https://cdn.discordapp.com/attachments/703406022953533552/743094479829073920/girl.gif',
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
        'https://cdn.discordapp.com/attachments/703406022953533552/743094210181464074/tenor_1.gif',
  ),
};
