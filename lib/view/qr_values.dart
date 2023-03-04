import 'package:dof_agein/view/fisher_id_verification.dart';
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
    //final List<String> qrDataList = qrResult!.code!.split('\n');
     
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:

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
          "FID Verification",
          style: TextStyle(
              color: Colors.black.withOpacity(.65),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.blueGrey.withOpacity(.3),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: Text(
                        "Check the URL is same or not and then click on verify to see the fisher...",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                Container(
                  // height: 50,
                  width: double.infinity,
                  color: Colors.blueGrey.withOpacity(.05),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: Text(
                        "Authentic: dof-demo.rdtl.xyz/fisher-id-card-verification/.../...",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),

                Container(
                 // height: 50,
                  width: double.infinity,
                  color: Colors.blueGrey.withOpacity(.05),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: Text(
                        "Scanned: ${qrResult!.code}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * .04,),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(

                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(120, 50)),
                          backgroundColor: MaterialStateProperty.all(Colors.red)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FisherIdentification(fisherIdUrl: qrResult,) ));
                      },
                      child: Text("Verify",style: TextStyle(
                          fontSize: 20,
                          color: Colors.white ),)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
