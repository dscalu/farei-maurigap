import 'package:mauri_gap/utils/date_picker.dart';

class Farmer {
  String firstName;
  String surName;
  String nidNo;
  String sfwfRegNo;
  String farmUnit;

  Farmer(
      {this.firstName,
      this.surName,
      this.nidNo,
      this.sfwfRegNo,
      this.farmUnit});

  @override
  String toString() {
    return 'Farmer{'
        'firstName: $firstName, '
        'surName: $surName, '
        'nidNo: $nidNo, '
        'sfwfRegNo: $sfwfRegNo, '
        'farmUnit: $farmUnit}';
  }

  toJSON() {
    return <String, dynamic>{
      'farmer_fname': firstName,
      'farmer_surname': surName,
      'farmer_nid': nidNo,
      'farmer_sfwf': sfwfRegNo,
      'farmer_farmunit': farmUnit,
      'created_on': getDateNow(),
    };
  }
}
