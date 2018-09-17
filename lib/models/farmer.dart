class Farmer {
  String firstName;
  String surName;
  String nidNo;
  String sfwfRegNo;
  String farmName;

  Farmer(
      this.firstName, this.surName, this.nidNo, this.sfwfRegNo, this.farmName);

  @override
  String toString() {
    return 'Farmer{'
        'firstName: $firstName, '
        'surName: $surName, '
        'nidNo: $nidNo, '
        'sfwfRegNo: $sfwfRegNo, '
        'farmName: $farmName}';
  }
}
