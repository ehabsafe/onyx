import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutter_toggle_tab/helper.dart';
import 'package:onyx_delivery_service/utils/theme.dart';
import 'package:onyx_delivery_service/view/fillterScreen.dart';
import 'package:onyx_delivery_service/view/newScreen.dart';
import 'package:onyx_delivery_service/view/otherScreen.dart';

class HomeToggleTab extends StatefulWidget {
  const HomeToggleTab({Key? key}) : super(key: key);

  @override
  State<HomeToggleTab> createState() => _CustomToggleTabState();
}

class _CustomToggleTabState extends State<HomeToggleTab> {
  var _tabTextIndexSelected = 0;
  var _listTextTabToggle = ["News", "Others"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FillterScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 20, left: 20),
              child: SizedBox(
                height: 35,
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    contentPadding: EdgeInsets.all(0.0),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                    ),
                    isDense: true,
                    alignLabelWithHint: true,
                    isCollapsed: false,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(),
                    ),
                    hintStyle: TextStyle(fontSize: 12),
                    hintText: 'Search for CSTMR_NM , RGN_NM & MOBILE_NO ',
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: heightInPercent(2, context),
          ),
          FlutterToggleTab(
            // width in percent
            width: 80,
            borderRadius: 30,
            height: 35,
            selectedIndex: _tabTextIndexSelected,
            selectedBackgroundColors: [secondryColor],
            selectedTextStyle: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
            unSelectedTextStyle: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500),
            labels: _listTextTabToggle,
            selectedLabelIndex: (index) {
              setState(() {
                _tabTextIndexSelected = index;
              });
            },
            isScroll: false,
          ),
          Container(
            height: heightInPercent(1, context),
          ),
          _tabTextIndexSelected == 0 ? NewScreen() : OtherScreen(),
          Container(
            height: heightInPercent(3, context),
          ),
        ],
      ),
    );
  }
}
