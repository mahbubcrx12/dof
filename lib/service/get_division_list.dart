
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/division_model.dart';

class GetDivisionList {
  static const Map<String, String> defaultHeader = {
    "Accept": "application/json",
  };

  Future<List<DivisionList>> fetchDivision() async {
    List<DivisionList> divisionListData = [];

    try {
      var link = "http://dof-demo.rdtl.xyz/api/address/get-division";
      var response =
      await http.get(Uri.parse(link), headers: await defaultHeader);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        DivisionList divisionData;
        for (var i in data) {
          divisionData = DivisionList.fromJson(i);
          divisionListData.add(divisionData);
        }
        return divisionListData;
      } else {
        return divisionListData;
      }
    } catch (e) {
      print(e);
      return divisionListData;
    }
  }
}