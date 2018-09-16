enum Input {
  Seed,
  PlantingMaterial,
  Fertilizer,
  SoilAmendment,
  Manure,
  Pesticides
}

class Stock {
  Input input;
  String supplierName;
  String supplierAddr;
  num qtyPurchased;
  DateTime dateReceived;
  String storageAddr;

  Stock(this.input, this.supplierName, this.supplierAddr, this.qtyPurchased,
      this.dateReceived, this.storageAddr);

  @override
  String toString() {
    return 'Stock{input: $input, supplierName: $supplierName, supplierAddr: '
        '$supplierAddr, qtyPurchased: $qtyPurchased, dateReceived: '
        '$dateReceived, storageAddr: $storageAddr}';
  }
}
