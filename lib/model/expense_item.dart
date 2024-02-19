class ExpenseItem {
  String? description;
  DateTime? date;
  double? cost;

  ExpenseItem({this.description, this.date, this.cost});

  factory ExpenseItem.fromJson(Map<String, dynamic> parsedJson) {
    return ExpenseItem(
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
