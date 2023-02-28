import 'package:dof_agein/view/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QrValues extends StatelessWidget {
  final Barcode? qrResult;
 
  const QrValues({Key? key,
   // required this.qrDataList,
    required this.qrResult}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    final List<String> qrDataList = qrResult!.code!.split('\n');
     
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:
        // InkWell(
        //   onTap: (){
        //      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QRScanner()));
        //   },
        //   child: Icon(Icons.arrow_back_ios),
        // ),
        IconButton(
          splashColor: Colors.blueGrey[200],
          splashRadius: 30,
          onPressed: (() {
            Future.delayed(const Duration(milliseconds: 60), () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QRScanner()));
            });
            Navigator.pop(context);
          }),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black.withOpacity(.65),
          ),
        ),
        title: Text(
          "Scanned Values",
          style: TextStyle(
              color: Colors.black.withOpacity(.65),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${qrResult!.code}'),
              Text(qrDataList[0]),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              Text(qrDataList[0].substring(12),style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),),
              // Text(qrDataList[1],style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w500
              // )),
              // Text(qrDataList[2],style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w500
              // )),
              // Text(qrDataList[3],style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w500
              // )),
              SizedBox(height: MediaQuery.of(context).size.height * .1,),
              ElevatedButton(

                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(120, 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    // if (_key.currentState!.validate()) {
                    //   _key.currentState!.save();
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (_) => SearchFisherMan(
                    //         searchInput: filterController.text,
                    //       )));
                    // }
                  },
                  child: Text("Verify Fisher",style: TextStyle(
                      fontSize: 20,
                      color: Colors.white ),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
