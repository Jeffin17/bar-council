import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';
import '../widgets/MyBottomNavBar_final.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> datam = [];
  List SelectedData = [];
  TextEditingController selectedController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Getimage();
    dataFetch();
  }

  Future<void> dataFetch() async {
    final response = await http.get(
      Uri.parse("http://192.168.1.58:5000/api/user/list_users"),
      headers: {
        "Content-Type": "application/json", // Specify the content type
        // Add any additional headers if required
      },
    );
    if (response.statusCode == 200) {
      print("sucess");
      setState(() {

      });
      datam = jsonDecode(response.body);
      print(datam.runtimeType);
      print(datam.toString());
      print(datam[10]["id"]);
      // print(data.toString());
      setState(() {

      });
    } else {
      print("Failed");
    }
  }

  Getimage() async {
    const String apiUrl =
        "${baseUrl}api/image/get"; // Replace with your API endpoint

    final Map<String, dynamic> data = {
      "phone": "9072176204",
      // Add more key-value pairs as needed
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json", // Specify the content type
        // Add any additional headers if required
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // datas = response.body;

      final result = jsonDecode(response.body);

      // print(result);
      datas = result['image']['data'];
      setState(() {});
      print("Response: ${response.body}");
      // print(datas['image']);
    } else {
      print("Status Code: ${response.statusCode}");
      print("Response: ${response.body}");
    }
  }

  var datas;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    )),
              ],
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: datas != null
                  ? MemoryImage(base64Decode(datas))
                  : const AssetImage('assets/images/man.png')
                      as ImageProvider<Object>?,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "John deo",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            TextField(
              controller: selectedController,
              onChanged: (pattern) {
                setState(() {
                  SelectedData.where((item) => item['cust_area']
                      .toLowerCase()
                      .startsWith(pattern.toLowerCase()));
                });
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                // Adjust the vertical padding
                suffixIcon: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                ),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      width: 2,
                      color: appcolor
                          .withOpacity(.3)), // Border color when not in focus
                ),
                hintText: 'Search',
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 2, color: appcolor), // Border color when focused
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
            ),
            Expanded(
              child:datam.isEmpty ?Center(child: CircularProgressIndicator()) : ListView.builder(
                itemCount:datam.length,
                itemBuilder: (context, index) {
                  print(datam.length);
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Container(
                      height: height * .15,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Center(child: Text(datam[index]["regNo"].toString(),style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white), )),
                          Center(child: Text(datam[index]["phone"].toString(), style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),)),
                          Center(child: Text(datam[index]["firstName"].toString(), style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),)),
                          Center(child: Text(datam[index]["lastName"].toString(), style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// datas != null ? MemoryImage(base64Decode(datas)) as ImageProvider<Object>?: AssetImage('assets/images/man.png') as ImageProvider<Object>?),


// http://192.168.1.58:5000/api/user/list_users