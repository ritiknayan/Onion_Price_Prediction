import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../data/data.dart';
import 'home_screen.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});
  static const routeName = '/ProjectScreen';
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.grey,
      // appBar: screenSize.width > 500
      //     ? null
      //     : AppBar(
      //         backgroundColor: kGradient2,
      //       ),
      // drawer: screenSize.width > 500
      //     ? null
      //     : const Drawer(
      //         child: MyDrawer(),
      //       ),
      // appBar: appBarForBigScreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            getHeader(context),
            SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(color: Colors.black, width: 1.5),
                  columnWidths: const {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(4),
                    2: FlexColumnWidth(4),
                    3: FlexColumnWidth(4),
                    4: FlexColumnWidth(4),
                    5: FlexColumnWidth(4),
                    6: FlexColumnWidth(4),
                  },
                  children: [
                    TableRow(children: [
                      Text(
                        "Month",
                        style: kSectionTitleText.copyWith(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "2017",
                        style: kSectionTitleText.copyWith(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "2019",
                        style: kSectionTitleText.copyWith(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "2020",
                        style: kSectionTitleText.copyWith(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "2021",
                        style: kSectionTitleText.copyWith(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "2022",
                        style: kSectionTitleText.copyWith(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "2023",
                        style: kSectionTitleText.copyWith(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ]),
                    tr('Jan', 10.587189, 10.693738, 17.285157, 12.596946,
                        24.529586, 19.967759),
                    tr('Feb', 9.671990, 10.528602, 12.115188, 10.630561,
                        25.314735, 0),
                    tr('Mar', 9.618950, 10.625024, 11.662520, 11.076917,
                        20.967993, 0),
                    tr('Apr', 9.742866, 10.693028, 11.495808, 11.496550,
                        15.077339, 0),
                    tr('May', 11.056074, 10.850595, 11.819389, 14.097460,
                        13.737258, 0),
                    tr('Jun', 13.110888, 11.774837, 11.417481, 19.309295,
                        14.736391, 0),
                    tr('Jul', 15.242025, 11.905044, 13.231679, 17.451197,
                        16.125258, 0),
                    tr('Aug', 16.219103, 20.797275, 15.099412, 15.023803,
                        16.484666, 0),
                    tr('Sep', 0, 20.267318, 15.898079, 14.090591, 16.337127, 0),
                    tr('Oct', 0, 0, 20.079186, 20.103880, 19.042545, 0),
                    tr('Nov', 0, 0, 0, 16.396478, 21.321277, 0),
                    tr('Dec', 0, 0, 0, 14.884564, 18.682375, 0)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow tr(
    String month,
    double x1,
    double x2,
    double x3,
    double x4,
    double x5,
    double x6,
  ) {
    return TableRow(
      children: [
        Text("${month}",
            style: kSectionTitleText.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w200,
                color: Colors.black54)),
        Text(
          "${x1.toStringAsFixed(3)}/-",
          style: kSectionTitleText.copyWith(
              fontSize: 18, fontWeight: FontWeight.w200, color: Colors.black54),
        ),
        Text(
          "${x2.toStringAsFixed(3)}/-",
          style: kSectionTitleText.copyWith(
              fontSize: 18, fontWeight: FontWeight.w200, color: Colors.black54),
        ),
        Text(
          "${x3.toStringAsFixed(3)}/-",
          style: kSectionTitleText.copyWith(
              fontSize: 18, fontWeight: FontWeight.w200, color: Colors.black54),
        ),
        Text(
          "${x4.toStringAsFixed(3)}/-",
          style: kSectionTitleText.copyWith(
              fontSize: 18, fontWeight: FontWeight.w200, color: Colors.black54),
        ),
        Text(
          "${x5.toStringAsFixed(3)}/-",
          style: kSectionTitleText.copyWith(
              fontSize: 18, fontWeight: FontWeight.w200, color: Colors.black54),
        ),
        Text(
          "${x6.toStringAsFixed(3)}/-",
          style: kSectionTitleText.copyWith(
              fontSize: 18, fontWeight: FontWeight.w200, color: Colors.black54),
        ),
      ],
    );
  }
}
