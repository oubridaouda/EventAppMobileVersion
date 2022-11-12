import 'package:dropdown_search/dropdown_search.dart';
import 'package:event_mobile_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileForm extends StatelessWidget {
  EditProfileForm({Key? key}) : super(key: key);
  final List<String> countryListType = ["Burkina Faso", "Mali", "Niger", 'Ghana', "Cote d'Ivoire", 'Nigeria', 'Togo', 'Bénin'];
  String? selectEventType;
  String? selectCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        shadowColor: lightColor.snowDriftColor,
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              SizedBox(
                width: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor:
                        darkMode ? darkColor.dGreen : lightColor.snowDriftColor,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.xmark,
                        size: 15,
                        color: lightColor.dGrey,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 1,
        backgroundColor: lightColor.dWhite,
        title: Text(
          "Edit Details",
          style: TextStyle(
              color: darkMode ? darkColor.dBlack : lightColor.dBlack,
              fontWeight: FontWeight.w500,
              fontSize: 16.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 0, right: 30, left: 30, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Name*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                height: 24.0,
              ),
              const Text(
                "Email*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                height: 24.0,
              ),
              const Text(
                "Phone*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                height: 24.0,
              ),
              const Text(
                "Website*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                height: 24.0,
              ),
              const Text(
                "Facebook*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                height: 24.0,
              ),
              const Text(
                "Instagram*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                height: 24.0,
              ),
              const Text(
                "Twitter*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                height: 24.0,
              ),
              const Text(
                "Linkedin*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                height: 24.0,
              ),
              const Text(
                "Youtube*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
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
              const Text(
                "Address",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 13.0,
              ),
              Divider(
                thickness: 2,
                color: lightColor.dBackgroud,
              ),

              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Address 1*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                  darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                height: 24.0,
              ),
              const Text(
                "Address 2*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                  darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                height: 24.0,
              ),
              const Text(
                "Country*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                    showSearchBox: true,
                    showSelectedItems: true,
                    menuProps: MenuProps()
                ),
                items:  countryListType,
                dropdownDecoratorProps:  DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    // labelText: "Menu mode",
                    labelStyle: const TextStyle(color: Colors.blue),
                    hintText: "Select your country",
                    filled: true,
                    fillColor: darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
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
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "State*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                  darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                height: 24.0,
              ),
              const Text(
                "City/Suburb*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                  darkMode ? darkColor.InputColor : lightColor.InputColor,
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
                height: 24.0,
              ),
              const Text(
                "Zip/Post Code*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                  darkMode ? darkColor.InputColor : lightColor.InputColor,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  SizedBox(
                    height: 50,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        backgroundColor:
                        darkMode ? darkColor.dWhite : lightColor.dWhite,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: lightColor.dBlack),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        backgroundColor:
                        darkMode ? darkColor.dGreen : lightColor.dGreen,
                      ),
                      onPressed: () async {
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Update",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
