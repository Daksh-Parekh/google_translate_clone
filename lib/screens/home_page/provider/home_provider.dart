import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_translate_clone/utils/helper/api_helper.dart';

class HomeProvider with ChangeNotifier {
  String? dataa;

  Future<void> translateData(String text) async {
    ApiHelper helper = ApiHelper();
    dataa = await helper.translateAPI(text);
    log('$dataa');
    notifyListeners();
  }

  var data;
  void languageData() async {
    ApiHelper helper = ApiHelper();
    data = await helper.translateLangAPI();
    print("$data");
    notifyListeners();
  }
}
