class HelpRecord {
  String title;
  String instructions;

  HelpRecord({this.title, this.instructions});

  @override
  String toString() {
    return 'HelpRecord{title: $title, instructions: $instructions}';
  }

  toJSON() {
    return <String, dynamic>{};
  }
}
