import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataRepository {
  Future  readJsonFile(BuildContext context) async {
    try {
      var input = await rootBundle.loadString("assets/data/data.json");
      var map = jsonDecode(input);
      return map;
    } catch (e) {
      log("Exception occur $e");
      return null;
    }
  }
}
