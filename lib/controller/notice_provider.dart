import 'package:flutter/cupertino.dart';
import '../model/notice_model.dart';
import '../service/get_all_notice.dart';

class NoticeProvider with ChangeNotifier {
  List<Data> noticeData = [];
  getNoticeData() async {
    noticeData = await GetNoticeData().fetcNotices();
    notifyListeners();
  }
}