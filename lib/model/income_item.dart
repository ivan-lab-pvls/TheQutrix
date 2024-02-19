class IncomeItem {
  String? description;
  DateTime? date;
  double? cost;

  IncomeItem({this.description, this.date, this.cost});

  factory IncomeItem.fromJson(Map<String, dynamic> parsedJson) {
    return IncomeItem(
        description: parsedJson['description'] ?? "",
        cost: parsedJson['cost'] ?? "",
        date: DateTime.tryParse(parsedJson['date']));
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "cost": cost,
      "date": date.toString(),
    };
  }
}
