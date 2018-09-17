import './field.dart';

class Harvest {
  Field field;
  String produce;
  DateTime harvestDate;
  num area;
  num units;
  String harvester;

  Harvest(this.field, this.produce, this.harvestDate, this.area, this.units,
      this.harvester);

  @override
  String toString() {
    return 'Harvest{'
        'field: $field, '
        'produce: $produce, '
        'harvestDate: $harvestDate, '
        'area: $area, '
        'units: $units, '
        'harvester: $harvester}';
  }
}
