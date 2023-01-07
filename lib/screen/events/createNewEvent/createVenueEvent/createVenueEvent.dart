import 'package:dropdown_search/dropdown_search.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateVenueEvent extends StatefulWidget {
  const CreateVenueEvent({Key? key}) : super(key: key);

  @override
  State<CreateVenueEvent> createState() => _CreateVenueEventState();
}

AppColors appColor = AppColors();

class _CreateVenueEventState extends State<CreateVenueEvent> {
  var isLoading = false;
  String? selectEventType;
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
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: darkMode ? darkColor.dWhite : lightColor.dWhite,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Row(children: [
              FaIcon(
                FontAwesomeIcons.circleInfo,
                color: darkMode ? lightColor.dBlack : darkColor.dWhite,
                size: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Details",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              )
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Divider(
              thickness: 2,
              color: lightColor.dBackgroud,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: const [
                Text(
                  "Give your event a name.*",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "See how your name appears on the event page and a list of all places where your event name will be used.",
              style: TextStyle(
                color: lightColor.dGrey,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Learn more",
                style: TextStyle(
                    color: lightColor.dGreen, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              onChanged: (textPass) => setState(() {}),
              style: TextStyle(
                  color: darkMode ? lightColor.dWhite : darkColor.dWhite),
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    darkMode ? darkColor.InputColor : lightColor.InputColor,
                hintText: 'Enter event name here',
                enabledBorder: OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      color: darkMode
                          ? darkColor.InputColor
                          : lightColor.InputBorderColor,
                    )),
                focusedBorder: OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      color: lightColor.InputBorderColor,
                    )),
                errorBorder: const OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Choose a category for your event.*",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Choosing relevant categories and types helps to improve the discoverability of your event.",
              style: TextStyle(
                color: lightColor.dGrey,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Learn more",
                style: TextStyle(
                    color: lightColor.dGreen, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
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
                      hintText: "Select type",
                      filled: true,
                      fillColor: darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                  }),
                  selectedItem: selectEventType,
                ),
                const SizedBox(height: 20.0,),
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
                      hintText: "Select category",
                      filled: true,
                      fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                  }),
                  selectedItem: selectEventType,
                ),
                const SizedBox(height: 20.0,),
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
                      hintText: "Select sub-category",
                      filled: true,
                      fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                  }),
                  selectedItem: selectEventType,
                ),
                const SizedBox(height: 20.0,),
              ],
            ),
            TextField(
              onChanged: (textPass) => setState(() {}),
              style: TextStyle(
                  color: darkMode ? lightColor.dWhite : darkColor.dWhite),
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    darkMode ? darkColor.InputColor : lightColor.InputColor,
                hintText: 'When is your event?*',
                enabledBorder: OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      color: darkMode
                          ? darkColor.InputColor
                          : lightColor.InputBorderColor,
                    )),
                focusedBorder: OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      color: lightColor.InputBorderColor,
                    )),
                errorBorder: const OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              "When is your event?*",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              onChanged: (textPass) => setState(() {}),
              style: TextStyle(
                  color: darkMode ? lightColor.dWhite : darkColor.dWhite),
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    darkMode ? darkColor.InputColor : lightColor.InputColor,
                hintText: 'Entrez votre mot de passe',
                enabledBorder: OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      color: darkMode
                          ? darkColor.InputColor
                          : lightColor.InputBorderColor,
                    )),
                focusedBorder: OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      color: lightColor.InputBorderColor,
                    )),
                errorBorder: const OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () async {},
              style: ElevatedButton.styleFrom(
                backgroundColor: appColor.dGreen,
                padding: const EdgeInsets.all(20),
                elevation: 1.0,
              ),
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(color: Colors.white),
                        SizedBox(width: 14),
                        Text(
                          'Veuillez  patienter...',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    )
                  : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "Update Password",
                        style: TextStyle(
                            fontSize: 16,
                            color: darkMode
                                ? darkColor.dWhite
                                : lightColor.dWhite),
                      ),
                    ]),
            ),
          ],
        ),
      ),
    );
  }
}
