import 'package:flutter/material.dart';

class VerificationError extends StatelessWidget {
  const VerificationError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          splashColor: Colors.blueGrey[200],
          splashRadius: 30,
          onPressed: (() {
            Future.delayed(const Duration(milliseconds: 60), () {
              Navigator.pop(context);
            });
          }),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black.withOpacity(.65),
          ),
        ),
        title: Text(
          "Verification Failed",
          style: TextStyle(
              color: Colors.black.withOpacity(.65),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}

