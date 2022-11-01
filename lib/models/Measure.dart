class Measure {
  String label;
  num value;
  num minValue;
  num maxValue;
  String? unidade;
  Function(num)? function;
  Measure(this.label, this.value, this.minValue, this.maxValue, this.unidade,
      this.function);

  factory Measure.fromJson(Map<String, dynamic> json) {
    print(json);
    return Measure(
      json['label'],
      json['value'],
      json['minValue'],
      json['maxValue'],
      json['unidade'],
      json['function'],
    );
  }

  Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
        'minValue': minValue,
        'maxValue': maxValue,
        'unidade': unidade,
        'function': function,
      };
}
