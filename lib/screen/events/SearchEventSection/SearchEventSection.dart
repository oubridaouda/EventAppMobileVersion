import 'package:dropdown_search/dropdown_search.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/menu/toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchEventSection extends StatefulWidget {
  const SearchEventSection({Key? key}) : super(key: key);

  @override
  State<SearchEventSection> createState() => _SearchEventSectionState();
}

class _SearchEventSectionState extends State<SearchEventSection> {

  String? selectEventType;
  String? selectCity;
  final List<String> eventListType = [
    "All",
    "Arts",
    "Business",
    'Coaching and Consulting',
    'Community and Culture',
    'Education and Training',
    'Family and Friends',
    'Fashion and Beauty'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 70,
        bottom: 80,
      ),
      alignment: Alignment.center,
      color: darkMode ? darkColor.dBackgroud : lightColor.dBackgroud,
      child: Column(
        children: [
          const Text(
            "Discover Events For All The Things You Love",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          const ToggleButton(),
          const SizedBox(
            height: 15,
          ),
          DropdownSearch<String>(
            popupProps: const PopupProps.menu(
                showSearchBox: true,
                showSelectedItems: true,
                menuProps: MenuProps()),
            items: eventListType,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                // labelText: "Menu mode",
                labelStyle: TextStyle(color: Colors.blue),
                hintText: "Type of event",
                filled: true,
                fillColor:
                darkMode ? darkColor.dWhite : lightColor.dWhite,
                enabledBorder: OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius:
                  const BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    color: darkMode
                        ? darkColor.InputColor
                        : lightColor.InputBorderColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius:
                  const BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    color: lightColor.InputBorderColor,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            onChanged: ((value) {
              print(value);
              selectEventType = value;
              print(toggleEventType);
            }),
            selectedItem: selectEventType,
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: const [
              "Ouagadougou",
              "Lomé",
              "Brazzaville",
              'Abidjan'
            ],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                // labelText: "Menu mode",
                hintText: "City",
                filled: true,
                fillColor:
                darkMode ? darkColor.dWhite : lightColor.dWhite,
                enabledBorder: OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    color: darkMode
                        ? darkColor.InputColor
                        : lightColor.InputBorderColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    color: lightColor.InputBorderColor,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            onChanged: ((value) {
              print(value);
              selectCity = value;
            }),
            selectedItem: selectCity,
          ),
          // DropdownButtonHideUnderline(
          //   child: ButtonTheme(
          //     alignedDropdown: true,
          //     child: DropdownButton(
          //       hint: const Text("Select Event Type"),
          //       value: _selected,
          //       onChanged: (newValue) {
          //         setState(() {
          //           _selected = newValue;
          //         });
          //       },
          //       items: _myJson.map((myItem) {
          //         print(
          //             "${myItem["value"]} and select: $_selected and id: ${myItem["id"]}");
          //         return DropdownMenuItem(
          //           value: myItem["id"].toString(),
          //           child: Row(
          //             children: [
          //               Icon(myItem["icon"]),
          //               Text(myItem["value"]),
          //             ],
          //           ),
          //         );
          //       }).toList(),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 35,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                backgroundColor:
                darkMode ? darkColor.dGreen : lightColor.dGreen,
              ),
              onPressed: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Find",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}