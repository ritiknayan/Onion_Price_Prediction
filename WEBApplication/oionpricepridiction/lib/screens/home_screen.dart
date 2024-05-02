import 'package:flutter/material.dart';
import 'package:oionpricepridiction/beckend/beckend.dart';
import 'package:oionpricepridiction/models/project_model.dart';
import 'package:oionpricepridiction/screens/widget/dropdownButton.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../data/data.dart';
import 'package:url_launcher/url_launcher.dart';

import 'information.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // getData(context);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: const [
      //       Icon(
      //         Icons.circle_sharp,
      //         size: 12,
      //         color: Colors.black,
      //       ),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Text(
      //         "Untitled UI",
      //         style: TextStyle(color: Colors.black),
      //       )
      //     ],
      //   ),
      //   // foregroundColor: Colors.black,
      //   backgroundColor: Colors.white,
      // ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back1.jpg"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getHeader(context),
              Center(
                  child: Text(
                "@$username",
                style: kSubTitleText,
              )),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: screenSize.width > 1200
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '  SELECT STATE',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MyDropDownButton(
                              dropDownListData: kStates,
                              id: 1,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '  SELECT DISTRICT',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ), 
                            // MyDropDownButton(
                            //     dropDownListData: kDistrict,
                            //     id: 2,
                            //   ),
                            Consumer<kdataaa>(
                              builder: (context, value, child) =>
                                  MyDropDownButton(
                                dropDownListData: value.kDistrict,
                                id: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '  SELECT VARIETY',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MyDropDownButton(
                              dropDownListData: kVariety,
                              id: 3,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '  SELECT MONTH',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MyDropDownButton(
                              dropDownListData: kMonth,
                              id: 4,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '  SELECED STATE PRODUCE ONION OR NOT',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MyDropDownButton(
                              dropDownListData: const ['True', 'False'],
                              id: 5,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '  SELECTED MONTH IS HARVESTING MONTH OR NOT',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MyDropDownButton(
                              dropDownListData: const ['True', 'False'],
                              id: 6,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '  DOES DROUGHT OCCURED IN THE SELECTED STATE',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MyDropDownButton(
                              dropDownListData: const ['True', 'False'],
                              id: 7,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenSize.width * 0.15, bottom: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor:
                                        Color.fromRGBO(151, 57, 97, 1),
                                    fixedSize: Size(screenSize.width * 0.4,
                                        screenSize.height * 0.07),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: () async {
                                  final isValid = await Server.estimateprice();
                                  resultDialog();
                                },
                                child: Text('PREDICT PRICE',
                                    style: kTitleText.copyWith(
                                        fontSize: 24, color: Colors.white)),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '  SELECT STATE',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MyDropDownButton(
                              dropDownListData: kStates,
                              id: 1,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '  SELECT DISTRICT',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Consumer<kdataaa>(
                              builder: (context, value, child) =>
                                  MyDropDownButton(
                                dropDownListData: value.kDistrict,
                                id: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '  SELECT VARIETY',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MyDropDownButton(
                              dropDownListData: kVariety,
                              id: 3,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '  SELECT MONTH',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MyDropDownButton(
                              dropDownListData: kMonth,
                              id: 4,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '  SELECED STATE PRODUCE ONION OR NOT',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MyDropDownButton(
                              dropDownListData: const ['True', 'False'],
                              id: 5,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '  SELECTED MONTH IS HARVESTING MONTH OR NOT',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MyDropDownButton(
                              dropDownListData: const ['True', 'False'],
                              id: 6,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '  DOES DROUGHT OCCURED IN THE SELECTED STATE',
                              style: kButtonTitle.copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MyDropDownButton(
                              dropDownListData: const ['True', 'False'],
                              id: 7,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenSize.width * 0.15),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor:
                                        Color.fromRGBO(151, 57, 97, 1),
                                    fixedSize: Size(screenSize.width * 0.4,
                                        screenSize.height * 0.07),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: () async {
                                  final isValid = await Server.estimateprice();
                                  resultDialog();
                                },
                                child: Text('PREDICT PRICE',
                                    style: kTitleText.copyWith(
                                        fontSize: 24, color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: screenSize.width > 1000 ? null : null),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resultDialog() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String price = DataModel.pridictedPrice!.toStringAsFixed(2);
    showDialog(
      context: context,
      builder: (context) => SizedBox(
        height: height * 0.06,
        width: width,
        child: SimpleDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          alignment: Alignment.center,
          title: Stack(alignment: Alignment.center, children: [
            Icon(
              Icons.check,
              size: height * 0.05,
              color: Colors.green,
            ),
            Icon(
              Icons.circle_outlined,
              size: height * 0.07,
              color: Colors.green,
            ),
          ]),
          contentPadding: EdgeInsets.symmetric(horizontal: width * 0.04),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                    'Estimated Price of onion in ${DataModel.district}, ${DataModel.state} is: ',
                    style: kTitleText.copyWith(
                        fontSize: 25, fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 12,
                ),
                Text('${price}',
                    style: kSubTitleText.copyWith(
                        fontSize: 30, color: Colors.green.shade600)),
                SizedBox(
                  height: height * 0.15,
                ),
                Text('kindly rate my prediction :)',
                    style: kTitleText.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w100)),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.grey.shade400,
                          fixedSize: Size(width * 0.2, height * 0.07),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Poor',
                          style: kTitleText.copyWith(
                              fontSize: 15, color: Colors.black38)),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.grey.shade400,
                          fixedSize: Size(width * 0.2, height * 0.07),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Good',
                          style: kTitleText.copyWith(
                              fontSize: 15, color: Colors.black54)),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.grey.shade400,
                          fixedSize: Size(width * 0.2, height * 0.07),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Excellent',
                          style: kTitleText.copyWith(
                              fontSize: 15, color: Colors.black54)),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void cancelAlertDialog() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) => Container(
        height: height * 0.06,
        width: width,
        child: SimpleDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          alignment: Alignment.center,
          title: Stack(alignment: Alignment.center, children: [
            Icon(
              Icons.check,
              size: height * 0.05,
              color: Colors.green,
            ),
            Icon(
              Icons.circle_outlined,
              size: height * 0.07,
              color: Colors.green,
            ),
          ]),
          contentPadding: EdgeInsets.symmetric(horizontal: width * 0.04),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'Predicted Price of Onion ',
                  style: kSubTitleText.copyWith(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('${DataModel.pridictedPrice} Rs.',
                    style: kTitleText.copyWith(
                        fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: height * 0.05,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.grey.shade400,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {},
                  child: const Text('Am I correct :)',
                      style: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'Manrope',
                        fontSize: 15.5,
                        fontWeight: FontWeight.w900,
                      )),
                ),
                SizedBox(
                  height: height * 0.04,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

void getData(BuildContext context) async {
  await Server.fetchMonth();
  await Server.fetchState();
  await Server.fetchVariety();
  await Server.fetchDistrict();
}

Widget getHeader(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 300,
    decoration: BoxDecoration(color: Color.fromRGBO(151, 57, 97, 1)
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [
        //     kGradient1,
        //     kGradient2,
        //   ],
        // ),
        ),
    child: MediaQuery.of(context).size.width > 500
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'India',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                    MediaQuery.of(context).size.width > 1200
                        ? Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()));
                                  },
                                  child: Text(
                                    "HOME",
                                    style: kTabBar.copyWith(fontSize: 15),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const InformationScreen()));
                                  },
                                  child: Text(
                                    "INFORMATION",
                                    style: kTabBar.copyWith(fontSize: 15),
                                  )),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          )
                        : Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()));
                                  },
                                  child: Text(
                                    "HOME",
                                    style: kTabBar,
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const InformationScreen()));
                                  },
                                  child: Text(
                                    "INFORMATION",
                                    style: kTabBar,
                                  )),
                            ],
                          ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(imagePath),
                      ),
                    ),
                    Center(
                        child: Text(
                      name,
                      style: kTitleText.copyWith(color: Colors.white),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    // const Center(
                    //     child: Text(
                    //   '@INDIA',
                    //   style: TextStyle(fontSize: 15),
                    // )),
                    const SizedBox(
                      height: 6,
                    )
                  ],
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(imagePath),
                      ),
                    ),
                    Center(
                        child: Text(
                      name,
                      style: kTitleText.copyWith(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.07),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    // const Center(
                    //     child: Text(
                    //   '@INDIA',
                    //   style: TextStyle(fontSize: 15),
                    // )),
                    const SizedBox(
                      height: 6,
                    )
                  ],
                ),
              ),
            ],
          ),
  );
}
