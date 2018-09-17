class Farmer {
  String firstName;
  String surName;
  String nidNo;
  String sfwfRegNo;
  String farmUnit;

  Farmer(
      this.firstName, this.surName, this.nidNo, this.sfwfRegNo, this.farmUnit);

  @override
  String toString() {
    return 'Farmer{'
        'firstName: $firstName, '
        'surName: $surName, '
        'nidNo: $nidNo, '
        'sfwfRegNo: $sfwfRegNo, '
        'farmUnit: $farmUnit}';
  }
}
