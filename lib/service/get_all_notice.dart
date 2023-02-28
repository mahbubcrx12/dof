import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/notice_model.dart';


class GetNoticeData {
  static const Map<String, String> defaultHeader = {
    "Accept": "application/json",
  };

  Future<List<Data>> fetcNotices() async {
    List<Data> noticeData = [];

    try {
      var link = "http://dof-demo.rdtl.xyz/api/noticeboard/get-all-notice";
      var response =
      await http.get(Uri.parse(link), headers: await defaultHeader);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        Data dataNotice;
        for (var i in data['data']) {
          dataNotice = Data.fromJson(i);
          noticeData.add(dataNotice);
        }
        return noticeData;
      } else {
        return noticeData;
      }
    } catch (e) {
      return noticeData;
    }
  }

}
