import 'package:assign/repositories/data_repositories.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../models/DataModel.dart';

class DataControllers extends GetxController {
  List<Data> loadedData = <Data>[].obs;
  String category = 'All';
  List categories = [];
  List<Data> temperoryData = <Data>[].obs;
  DataRepository dataRepository = Get.put(DataRepository());
  Future loadData(BuildContext context) async {
    var temp = await dataRepository.readJsonFile(context);
    for (var data in temp) {
      loadedData.add(Data.fromJson(data));
      if (!categories.contains(data["p_category"])) {
        categories.add(data["p_category"]);
      }
    }
    return loadedData;
  }

  List searchItem(String query) {
    List<Data> result = [];
    for (var item in loadedData) {
      if (item.pName.toString().toLowerCase().contains(query.toLowerCase())) {
        result.add(item);
      }
    }
    return result;
  }

  getCategory() {
    if (temperoryData.isEmpty) {
      temperoryData.addAll(loadedData);
    }
    loadedData.clear();
    for (var item in temperoryData) {
      if (item.pCategory.toString().toLowerCase() == category.toLowerCase()) {
        loadedData.add(item);
      }
    }
    update();
  }

  unselectCategory() {
    category = "All";
    loadedData.clear();

    loadedData.addAll(temperoryData);
    temperoryData.clear();
    update();
  }

  List getAllCategory() {
    List<String> result = [];
    if (temperoryData.isEmpty) {
      for (var item in loadedData) {
        if (!result.contains(item.pCategory)) {
          result.add(item.pCategory);
        }
      }
    } else {
      for (var item in temperoryData) {
        if (!result.contains(item.pCategory)) {
          result.add(item.pCategory);
        }
      }
    }

    return result;
  }
}
