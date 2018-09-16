import './field.dart';

enum Unit { kg, ml }

class Nutrient {
  Field field;
  String nutrientType;
  DateTime dateApplied;
  num amount;
  Unit unit;
  String applicationMode;
  String crop;
  num area;

  Nutrient(this.field, this.nutrientType, this.dateApplied, this.amount,
      this.unit, this.applicationMode, this.crop, this.area);

  @override
  String toString() {
    return 'Nutrient{field: $field, nutrientType: $nutrientType, dateApplied: '
        '$dateApplied, amount: $amount, unit: $unit, applicationMode: '
        '$applicationMode, crop: $crop, area: $area}';
  }
}
