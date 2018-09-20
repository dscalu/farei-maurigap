class Field {
  String fieldNumber;
  num fieldTotalArea;
  String fieldIrrigationSource;
  String fieldPhysicalBarrier;
  String fieldAddress;

  Field(
      {this.fieldNumber,
      this.fieldTotalArea,
      this.fieldIrrigationSource,
      this.fieldPhysicalBarrier,
      this.fieldAddress});

  @override
  String toString() {
    return 'FieldEntry{'
        'fieldNumber: $fieldNumber, '
        'fieldTotalArea: $fieldTotalArea, '
        'fieldIrrigationSource: $fieldIrrigationSource, '
        'fieldPhysicalBarrier: $fieldPhysicalBarrier, '
        'fieldAddress: $fieldAddress}';
  }

  toJSON() {
    return <String, dynamic>{};
  }
}
