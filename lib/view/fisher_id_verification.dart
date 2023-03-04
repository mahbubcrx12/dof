import 'package:dof_agein/view/home.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FisherIdentification extends StatefulWidget {
  final Barcode? fisherIdUrl;
  const FisherIdentification({Key? key,required this.fisherIdUrl}) : super(key: key);

  @override
  State<FisherIdentification> createState() => _FisherIdentificationState();
}

class _FisherIdentificationState extends State<FisherIdentification> {

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
          initialUrl: "${widget.fisherIdUrl!.code}",
          javascriptMode: JavascriptMode.unrestricted,

        ),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.verified,color: Colors.green,size: 50,),
          onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MatshoWebPage()));
          }
      ),
    );
  }
}
