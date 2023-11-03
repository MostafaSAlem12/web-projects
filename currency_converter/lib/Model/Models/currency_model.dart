class CurrencyModel {
  final String name;
  final double value;

  const CurrencyModel({required this.name, required this.value});
  static CurrencyModel fromJson(Map<String, dynamic> json, String currency) {
    return CurrencyModel(name: currency, value: json[currency]);
  }
}
