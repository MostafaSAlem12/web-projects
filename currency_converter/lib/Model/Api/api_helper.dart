import 'dart:convert';

import 'package:currency_converter/Core/Constants/app_links.dart';
import 'package:currency_converter/Model/Models/currency_model.dart';
import 'package:http/http.dart';

class ApiHelper {
  Future<CurrencyModel?> getCurrency(String base, String to) async {
    try {
      Response response = await get(Uri.parse('${AppLinks.link}?base=$base'));
      String body = response.body;
      Map<String, dynamic> decoded = jsonDecode(body);
      Map<String, dynamic> rates = decoded['rates'];
      return CurrencyModel.fromJson(rates, to);
    } catch (e) {
      return null;
    }
  }
}
