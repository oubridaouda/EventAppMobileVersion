import 'package:dropdown_search/dropdown_search.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';


class CreateVenueEvent extends StatefulWidget {
  const CreateVenueEvent({Key? key}) : super(key: key);

  @override
  State<CreateVenueEvent> createState() => _CreateVenueEventState();
}

AppColors appColor = AppColors();

class _CreateVenueEventState extends State<CreateVenueEvent> {
  TextEditingController eventStarDate = TextEditingController();
  TextEditingController eventStarTime = TextEditingController();
  TextEditingController eventEndDate = TextEditingController();
  TextEditingController eventEndTime = TextEditingController();
  var isLoading = false;
  bool moreAddress = false;
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
                      fillColor: darkMode
                          ? darkColor.InputColor
                          : lightColor.InputColor,
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
                const SizedBox(
                  height: 20.0,
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
                      labelStyle: const TextStyle(color: Colors.blue),
                      hintText: "Select category",
                      filled: true,
                      fillColor: darkMode
                          ? darkColor.InputColor
                          : lightColor.InputColor,
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
                const SizedBox(
                  height: 20.0,
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
                      hintText: "Select sub-category",
                      filled: true,
                      fillColor: darkMode
                          ? darkColor.InputColor
                          : lightColor.InputColor,
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
                const SizedBox(
                  height: 20.0,
                ),
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
            Text(
              "Tell your attendees when your event starts so they can get ready to attend.",
              style: TextStyle(
                color: lightColor.dGrey,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Event Start Date.*",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
            ),
            TextFormField(
              readOnly: true,
              controller: eventStarDate,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedStartDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedStartDate != null) {
                  print(
                      pickedStartDate); //pickedStartDate output format => 2021-03-10 00:00:00.000
                  String formattedStartDate =
                      DateFormat('yyyy-MM-dd').format(pickedStartDate);
                  print(
                      formattedStartDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    eventStarDate.text =
                        formattedStartDate; //set the value of text field.

                    // dateController.text =
                    //     formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    darkMode ? darkColor.InputColor : lightColor.InputColor,
                hintText: 'YYYY/MM/DD',
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veillez entrez la date";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Event Start Time.*",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
            ),
            TextFormField(
              readOnly: true,
              controller: eventStarTime,
              //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay? pickedStartTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if (pickedStartTime != null) {
                  //output 10:51 PM
                  final formattedStartTime = TimeOfDay(
                          hour: pickedStartTime.hour,
                          minute: pickedStartTime.minute)
                      .format(context);
                  //converting to DateTime so that we can further format on different pattern.
                  print(formattedStartTime); //17:30
                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                  setState(() {
                    eventStarTime.text =
                        formattedStartTime; //set the value of text field.
                  });
                } else {
                  print("Time is not selected");
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    darkMode ? darkColor.InputColor : lightColor.InputColor,
                hintText: 'HH:MM',
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veillez entrez l'heure";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Event End Date.*",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
            ),
            TextFormField(
              readOnly: true,
              controller: eventEndDate,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedEndDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedEndDate != null) {
                  print(
                      pickedEndDate); //pickedEndDate output format => 2021-03-10 00:00:00.000
                  String formattedEndDate =
                      DateFormat('yyyy-MM-dd').format(pickedEndDate);
                  print(
                      formattedEndDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    eventEndDate.text =
                        formattedEndDate; //set the value of text field.

                    // dateController.text =
                    //     formattedEndDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    darkMode ? darkColor.InputColor : lightColor.InputColor,
                hintText: 'YYYY/MM/DD',
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veillez entrez la date";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Event End Time.*",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
            ),
            TextFormField(
              readOnly: true,
              controller: eventEndTime,
              //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay? pickedEndTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if (pickedEndTime != null) {
                  //output 10:51 PM
                  final formattedEndTime = TimeOfDay(
                          hour: pickedEndTime.hour,
                          minute: pickedEndTime.minute)
                      .format(context);
                  //converting to DateTime so that we can further format on different pattern.
                  print(formattedEndTime); //17:30
                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                  setState(() {
                    eventEndTime.text =
                        formattedEndTime; //set the value of text field.
                  });
                } else {
                  print("Time is not selected");
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    darkMode ? darkColor.InputColor : lightColor.InputColor,
                hintText: 'HH:MM',
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veillez entrez l'heure";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Add a few images to your event banner.",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Upload colorful and vibrant images as the banner for your event! See how beautiful images help your event details page. ",
              style: TextStyle(
                color: lightColor.dGrey,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 230.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: darkMode ? darkColor.dBackgroud : lightColor.dBackgroud,
                ),
                child:
            CachedNetworkImage(
              imageUrl: "https://www.e.kossyam.com/assets/images/banners/custom-img.jpg",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              progressIndicatorBuilder:
                  (context, url, downloadProgress) =>
                  CircularProgressIndicator(
                      color: lightColor.dGreen,
                      value: downloadProgress.progress),
              errorWidget: (context, url, error) =>
                  Container(child: Text("Image not found"),),
            )),

            Transform.translate(
              offset: const Offset(190.0, -215.0),
              child: SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    backgroundColor:
                    darkMode ? darkColor.dWhite : lightColor.dWhite,
                  ),
                  onPressed: () async {
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Change Image",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Please describe your event.",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Write a few words below to describe your event and provide any extra information such as schedules, itinerary or any special instructions required to attend your event.",
              style: TextStyle(
                color: lightColor.dGrey,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Where is your event taking place? *",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Add a venue to your event to tell your attendees where to join the event.",
              style: TextStyle(
                color: lightColor.dGrey,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Venue*",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
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
                hintText: 'Enter your venue',
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
              "Country*",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
            ),
            const SizedBox(
              height: 10.0,
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
                  hintText: "Select type",
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
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
              height: 30.0,
            ),
            const Text(
              "City/Suburb*",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
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
                hintText: 'Enter your venue',
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
              "More...",
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FlutterSwitch(
                  width: 44.0,
                  height: 22.0,
                  valueFontSize: 25.0,
                  toggleSize: 20.0,
                  value: moreAddress,
                  borderRadius: 30.0,
                  padding: 2.0,
                  showOnOff: true,
                  activeText: "",
                  inactiveText: "",
                  activeColor: lightColor.cyanColor,
                  inactiveColor: lightColor.cyanBlueColor,
                  onToggle: (val) {
                    setState(() {
                      moreAddress = val;
                    });
                  },
                ),
              ],
            ),
            moreAddress
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        const Text(
                          "Address line 1",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.0),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          onChanged: (textPass) => setState(() {}),
                          style: TextStyle(
                              color: darkMode
                                  ? lightColor.dWhite
                                  : darkColor.dWhite),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: darkMode
                                ? darkColor.InputColor
                                : lightColor.InputColor,
                            hintText: 'Enter your address line 1',
                            enabledBorder: OutlineInputBorder(
                                //Outline border type for TextFeild
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                borderSide: BorderSide(
                                  color: darkMode
                                      ? darkColor.InputColor
                                      : lightColor.InputBorderColor,
                                )),
                            focusedBorder: OutlineInputBorder(
                                //Outline border type for TextFeild
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                borderSide: BorderSide(
                                  color: lightColor.InputBorderColor,
                                )),
                            errorBorder: const OutlineInputBorder(
                              //Outline border type for TextFeild
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
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
                          "Address line 2",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.0),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          onChanged: (textPass) => setState(() {}),
                          style: TextStyle(
                              color: darkMode
                                  ? lightColor.dWhite
                                  : darkColor.dWhite),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: darkMode
                                ? darkColor.InputColor
                                : lightColor.InputColor,
                            hintText: 'Enter your address line 2',
                            enabledBorder: OutlineInputBorder(
                                //Outline border type for TextFeild
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                borderSide: BorderSide(
                                  color: darkMode
                                      ? darkColor.InputColor
                                      : lightColor.InputBorderColor,
                                )),
                            focusedBorder: OutlineInputBorder(
                                //Outline border type for TextFeild
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                borderSide: BorderSide(
                                  color: lightColor.InputBorderColor,
                                )),
                            errorBorder: const OutlineInputBorder(
                              //Outline border type for TextFeild
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
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
                          "State",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.0),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          onChanged: (textPass) => setState(() {}),
                          style: TextStyle(
                              color: darkMode
                                  ? lightColor.dWhite
                                  : darkColor.dWhite),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: darkMode
                                ? darkColor.InputColor
                                : lightColor.InputColor,
                            hintText: 'Enter your state',
                            enabledBorder: OutlineInputBorder(
                                //Outline border type for TextFeild
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                borderSide: BorderSide(
                                  color: darkMode
                                      ? darkColor.InputColor
                                      : lightColor.InputBorderColor,
                                )),
                            focusedBorder: OutlineInputBorder(
                                //Outline border type for TextFeild
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                borderSide: BorderSide(
                                  color: lightColor.InputBorderColor,
                                )),
                            errorBorder: const OutlineInputBorder(
                              //Outline border type for TextFeild
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
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
                          "Zip/Post Code",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.0),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          onChanged: (textPass) => setState(() {}),
                          style: TextStyle(
                              color: darkMode
                                  ? lightColor.dWhite
                                  : darkColor.dWhite),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: darkMode
                                ? darkColor.InputColor
                                : lightColor.InputColor,
                            hintText: 'Enter your Zip/Post Code',
                            enabledBorder: OutlineInputBorder(
                                //Outline border type for TextFeild
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                borderSide: BorderSide(
                                  color: darkMode
                                      ? darkColor.InputColor
                                      : lightColor.InputBorderColor,
                                )),
                            focusedBorder: OutlineInputBorder(
                                //Outline border type for TextFeild
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                borderSide: BorderSide(
                                  color: lightColor.InputBorderColor,
                                )),
                            errorBorder: const OutlineInputBorder(
                              //Outline border type for TextFeild
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        )
                      ])
                : Container(),
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
                        "Next",
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
