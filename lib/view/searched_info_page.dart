
import 'dart:convert';

import 'package:dof_agein/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../model/fisherman_model.dart';

class SearchFisherMan extends StatefulWidget {
  SearchFisherMan({Key? key, required this.searchInput}) : super(key: key);
  String searchInput;

  @override
  State<SearchFisherMan> createState() => _SearchFisherManState();
}

class _SearchFisherManState extends State<SearchFisherMan> {
  List<Data> fishermanData = [];

  Future<dynamic> fetchFisherman(searchInput) async {
    try {
      var link =
          "http://dof-demo.rdtl.xyz/api/fisher/get-details/${searchInput}";
      var response = await http.get(Uri.parse(link));

      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);


        Data fisharData;
        for (var i in data['data']) {
          fisharData = Data.fromJson(i);
          fishermanData.add(fisharData);

        }

        return fishermanData;
      } else {
        return fishermanData;
      }
    } catch (e) {
      print("Errrrrrr $e");
      return fishermanData;
    }
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await fetchFisherman(widget.searchInput);
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          leading: IconButton(
              splashRadius: 30,
              splashColor: Colors.blueGrey.shade200,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black.withOpacity(.65),
              )),
          centerTitle: true,
          title: Text(
            "Result",
            style: TextStyle(
                color: Colors.black.withOpacity(.65),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(onPressed: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SearchHere()));
                },
                    icon: Icon(Icons.search,color: Colors.black.withOpacity(.65),))
            )
          ],
        ),
        body: fishermanData.isNotEmpty
            ? ListView.builder(
            shrinkWrap: true,
            itemCount: fishermanData.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white.withOpacity(.90),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.blueGrey.withOpacity(.3),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Text(
                              "Personal Information(ব্যক্তিগত তথ্য)",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        //height: MediaQuery.of(context).size.height * .55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                      image: NetworkImage(
                                        "https://t3.ftcdn.net/jpg/01/65/63/94/360_F_165639425_kRh61s497pV7IOPAjwjme1btB8ICkV0L.jpg",
                                      ),
                                      height: 300,
                                      width: 300,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${fishermanData[index].fishermanNameBng}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${fishermanData[index].fishermanNameEng}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Form ID: ${fishermanData[index].formId}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "NID: ${fishermanData[index].nationalIdNo}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Gender (লিঙ্গ): ${fishermanData[index].gender}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Religion (ধর্ম): ${fishermanData[index].religion}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Date of Birth: ${fishermanData[index].dateOfBirth}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Mobile Number (মোবাইল নম্বর): ${fishermanData[index].mobile}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Place Of Birth (জন্মস্থান): ${fishermanData[index].placeOfBirth}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Educational Qualifications (শিক্ষাগত যোগ্যতা): ${fishermanData[index].education}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.blueGrey.withOpacity(.3),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Text(
                              "Family Information (পারিবারিক তথ্য) ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(.12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Mother's Name (মাতার নাম): ${fishermanData[index].mothersName}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Father's Name (পিতার নাম): ${fishermanData[index].fathersName}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Marital Status (বৈবাহিক অবস্থা): ${fishermanData[index].maritalStaus}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Spouse Name (স্বামী/স্ত্রীর নাম): ${fishermanData[index].spouseName}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total family members (পরিবারের মোট সদস্য সংখ্যা): ${fishermanData[index].totalFamilyMember}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Mother's number (মায়ের সংখ্যা): ${fishermanData[index].numberOfMother}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Father's number (পিতার সংখ্যা): ${fishermanData[index].numberOfFather}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Number of spouse (স্বামী/স্ত্রী সংখ্যা): ${fishermanData[index].numberOfSpouse}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Number of daughters (কন্যা সংখ্যা): ${fishermanData[index].numberOfDaughter}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Number of sons (পুত্র সংখ্যা): ${fishermanData[index].numberOfSon}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.blueGrey.withOpacity(.3),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Text(
                              "Permanent Address (স্থায়ী ঠিকানা)",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blueGrey.withOpacity(.1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Division (বিভাগ): ${fishermanData[index].permanentDivision}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "District (জেলা): ${fishermanData[index].permanentDistrict}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Upazila (উপজেলা): ${fishermanData[index].permanentUpazilla}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Municipality (পৌরসভা): ${fishermanData[index].permanentMuniciplaity}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Union (ইউনিয়ন): ${fishermanData[index].permanentUnion}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Village (গ্রাম): ${fishermanData[index].permanentVillage}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Post Office (ডাক ঘর): ${fishermanData[index].permenentPostOffice}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.blueGrey.withOpacity(.3),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Text(
                              "Present Address (বর্তমান ঠিকানা)",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blueGrey.withOpacity(.1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Division (বিভাগ): ${fishermanData[index].presentDistrict}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "District (জেলা): ${fishermanData[index].presentDistrict}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Upazilla (উপজেলা): ${fishermanData[index].presentUpazilla}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Municipality (পৌরসভা): ${fishermanData[index].presentMunicipality}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Union (ইউনিয়ন): ${fishermanData[index].presentUnion}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Village (গ্রাম): ${fishermanData[index].presentVillage}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.black26, width: 1),
                                        right: BorderSide(
                                            color: Colors.black26, width: 1),
                                        top: BorderSide(
                                            color: Colors.black26, width: 1),
                                        bottom: BorderSide(
                                            color: Colors.black26, width: 1),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Post Office (ডাক ঘর): ${fishermanData[index].presentPostOffice}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.blueGrey.withOpacity(.3),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Text(
                              "Fishing Information (মাছ ধরার তথ্য)",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blueGrey.withOpacity(.1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Types of fishing (মৎস্য আহরণের ধরন): ${fishermanData[index].typeOfFishing}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Ownership of the net (জালের মালিকানা): ${fishermanData[index].ownerOfNet}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Length of the net (জালের দৈর্ঘ্য): ${fishermanData[index].lengthOfNet}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Width of the net (জালের প্রস্থ): ${fishermanData[index].widthOfNet}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Price of net (জালের মূল্য): ${fishermanData[index].priceOfNet}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Type Of Vessels (নৌযানের ধরন): ${fishermanData[index].typeOfVessel}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Text(
                                    "Owner Of Vessels (নৌযানের মালিকানা): ${fishermanData[index].ownerOfVessel}",
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Length Of Vessels (নৌযানের দৈর্ঘ্য): ${fishermanData[index].lengthOfVessels}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Length Of Vessels (নৌযানের দৈর্ঘ্য): ${fishermanData[index].lengthOfVessels}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Width Of Vessels (নৌযানের প্রস্থ): ${fishermanData[index].widthOfVessels}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Height Of Vessels (নৌযানের উচ্চতা): ${fishermanData[index].heightOfVessels}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Price Of Vessels (নৌযানের মূল্য): ${fishermanData[index].priceOfVessels}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Types of employment on the boat (নৌযানে কর্মসংস্থানের ধরন): ${fishermanData[index].typeOfEmploymentonVessel}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Main Profession (প্রধান পেশা): ${fishermanData[index].mainProfession}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Sub Profession (সহযোগী পেশা): ${fishermanData[index].subProfession}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Annual Income (বার্ষিক আয়): ${fishermanData[index].annualIncome}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Annual savings amount (বার্ষিক সঞ্চয়ের পরিমাণ): ${fishermanData[index].fishermenYearlySaving}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Annual loan amount (বার্ষিক ঋণের পরিমাণ): ${fishermanData[index].fishermenYearlyLoan}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black26,width: 1),
                                        right: BorderSide(color: Colors.black26,width: 1),
                                        top: BorderSide(color: Colors.black26,width: 1),
                                        bottom: BorderSide(color: Colors.black26,width: 1),
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Livelihood crisis (জীবিকার আপদকাল): ${fishermanData[index].fishermenDangerPeriodofLiving}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
            : Center(
          child: SpinKitThreeBounce(
            color: Colors.green,
            size: 60,
          ),
        ));
  }
}