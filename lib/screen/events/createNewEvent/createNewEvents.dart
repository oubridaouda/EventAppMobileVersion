import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

AppColors appColor = AppColors();

class CreateNewEvents extends StatefulWidget {
  const CreateNewEvents({Key? key}) : super(key: key);

  @override
  State<CreateNewEvents> createState() => _CreateNewEventsState();
}

class _CreateNewEventsState extends State<CreateNewEvents> {
  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Create New Event",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Divider(),
              const SizedBox(
                height: 30.0,
              ),
              //Person account select box
              Container(
                color: lightColor.dWhite,
                width: 390,
                height: 230,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 60.0,
                      height: 60.0,
                      child: CircleAvatar(
                        backgroundColor: lightColor.btnColor,
                        child: const FaIcon(FontAwesomeIcons.video,
                            color: Colors.black),
                      ),
                    ),
                    const Text(
                      "Create an Online Event",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 300.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            Provider.of<AllChangeNotifier>(context, listen: false)
                                .changePage(DrawerSection.createOnlineEvent);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appColor.dGreen,
                          padding: const EdgeInsets.all(20),
                          elevation: 1.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Create",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FaIcon(
                              FontAwesomeIcons.arrowRight,
                              color: Colors.white,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              //Company account select box
              Container(
                color: lightColor.dWhite,
                width: 390,
                height: 230,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 60.0,
                      height: 60.0,
                      child: CircleAvatar(
                        backgroundColor: lightColor.btnColor,
                        child: const FaIcon(FontAwesomeIcons.locationDot,
                            color: Colors.black),
                      ),
                    ),
                    const Text(
                      "Create an Venue Event",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 300.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            Provider.of<AllChangeNotifier>(context, listen: false)
                                .changePage(DrawerSection.createVenueEvent);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appColor.dGreen,
                          padding: const EdgeInsets.all(20),
                          elevation: 1.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Create",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FaIcon(
                              FontAwesomeIcons.arrowRight,
                              color: Colors.white,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
