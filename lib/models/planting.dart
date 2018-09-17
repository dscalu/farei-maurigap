import '../models/field.dart';

enum ProductionSystem { OpenField, Protected, Hydroponics }

class PlantingRecord {
  String field;
  ProductionSystem system;
  DateTime datePlanted;
  String crop;
  num variety;
  num area;

  PlantingRecord(this.field, this.system, this.datePlanted, this.crop,
      this.variety, this.area);

  @override
  String toString() {
    return 'PlantingRecord{'
        'field: $field, '
        'system: $system, '
        'datePlanted: $datePlanted, '
        'crop: $crop, '
        'variety: $variety, area: $area}';
  }
}
