import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class kdataaa extends ChangeNotifier {
  List kDistrict = [];

  void setdistrict(List x) {
    kDistrict = x;
    notifyListeners();
  }
}

List kMonth = [];
List kStates = [];
List kVariety = [];

Color kGrey = const Color(0xFF334055);
Color kPrimaryColor = const Color(0xFF334055);
Color kWhite = Colors.white;
Color kBlack = Colors.black;

TextStyle kTitleText = GoogleFonts.poppins(
  color: Colors.black,
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
);

TextStyle kSubTitleText = GoogleFonts.montserrat(
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 12.0,
);

TextStyle kSectionTitleText = GoogleFonts.montserrat(
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
TextStyle kButtonTitle = GoogleFonts.ebGaramond(
  color: Color.fromARGB(255, 14, 13, 13),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateColor.resolveWith((states) => kGrey),
    foregroundColor: MaterialStateColor.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return Colors.black;
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed)) return Colors.white;
        return kGrey; // Defer to the widget's default.
      },
    ),
  ),
);
TextStyle kTabBar = GoogleFonts.gothicA1(
  color: Colors.black,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);

TextStyle kUserName = GoogleFonts.pacifico(
  color: Colors.black,
  fontSize: 20,
  // fontWeight: FontWeight.bold,
);
