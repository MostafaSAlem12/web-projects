import 'package:currency_converter/Model/Api/api_helper.dart';
import 'package:currency_converter/Model/Models/currency_model.dart';
import 'package:flutter/material.dart';

class MainScreenController extends ChangeNotifier {
  String _from = 'USD';
  String _to = 'EGP';
  String get from => _from;
  String get to => _to;

  final List<String> currencies = ['USD', 'EGP', 'EUR'];

  final ApiHelper _helper = ApiHelper();

  void setBase(String? base) {
    _from = base!;
    notifyListeners();
  }

  void convertTo(String? to) {
    _to = to!;
    notifyListeners();
  }

  void swap() {
    String temp = _from;
    _from = _to;
    _to = temp;
    notifyListeners();
  }

  Stream<CurrencyModel> conversionStream() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 200));
      CurrencyModel? currency = await _helper.getCurrency(_from, _to);
      yield currency!;
    }
  }
}
