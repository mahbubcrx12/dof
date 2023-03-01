import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FisherIdentification extends StatelessWidget {
  final Barcode? fisherIdUrl;
  const FisherIdentification({Key? key,required this.fisherIdUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black.withOpacity(.65),
            )),
        title: Text(
          "Fisher Identification",
          style: TextStyle(
              color: Colors.black.withOpacity(.65),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        child:
        WebView(
          initialUrl: "${fisherIdUrl!.code}",
          javascriptMode: JavascriptMode.unrestricted,
        ),
        // Center(
        //   child: Text("${fisherIdUrl!.code}"),
        // ),
      ),
    );
  }
}
