import 'dart:convert';

import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/About/EditProfileForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfileTabAbout extends StatefulWidget {
  Map userInfo;
   ProfileTabAbout({Key? key,required this.userInfo}) : super(key: key);

  @override
  State<ProfileTabAbout> createState() => _ProfileTabAboutState();
}

class _ProfileTabAboutState extends State<ProfileTabAbout> {
  @override
  Widget build(BuildContext context) {
    Map userData = widget.userInfo;
    Map userAddresses = jsonDecode(userData['data']["addresses"]);
    Map socialMedia = jsonDecode(userData['data']['socialNetworks']);
    print("about page ${userData['data']['addresses']}");
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: darkMode ? darkColor.dWhite : lightColor.dWhite,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "About",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        backgroundColor:
                            darkMode ? darkColor.dGreen : lightColor.dGreen,
                      ),
                      onPressed: () async {

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) {
                              return  EditProfileForm(userData : userData);
                            },
                            fullscreenDialog: true));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.penToSquare,
                            size: 14,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Edit",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: lightColor.dBackgroud,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Name",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    userData['data']['username'] ?? "",
                    style: TextStyle(
                        color: lightColor.dGrey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Divider(
                thickness: 2,
                color: lightColor.dBackgroud,
              ),
              const SizedBox(
                height: 25.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tell us about yourself and let people know who you are",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 13.0,
                  ),
                  Text(
                    userData['data']['bio'] ?? "",
                    style: TextStyle(fontSize: 16.0, color: lightColor.dGrey),
                  )
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Divider(
                thickness: 2,
                color: lightColor.dBackgroud,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25.0),
                  const Text(
                    "Find me on",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(height: 25.0),
                  //Social media icon button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialMedia['facebook'] !=null?
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          radius: 135,
                          backgroundColor: darkMode
                              ? darkColor.dGreen
                              : lightColor.dGreen,
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              radius: 125,
                              backgroundColor: darkMode
                                  ? darkColor.dWhite
                                  : lightColor.dWhite,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 200,
                                  child: ClipRRect(
                                      child: SvgPicture.asset(
                                          color: darkMode
                                              ? darkColor.dGreen
                                              : lightColor.dGreen,
                                          height: 20,
                                          'assets/social/facebook.svg')),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ) : Container(),
                      const SizedBox(
                        width: 10,
                      ),
                      socialMedia['instagram'] !=null?
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          radius: 135,
                          backgroundColor: darkMode
                              ? darkColor.dGreen
                              : lightColor.dGreen,
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              radius: 125,
                              backgroundColor: darkMode
                                  ? darkColor.dWhite
                                  : lightColor.dWhite,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 200,
                                  child: ClipRRect(
                                      child: SvgPicture.asset(
                                          color: darkMode
                                              ? darkColor.dGreen
                                              : lightColor.dGreen,
                                          height: 20,
                                          'assets/social/instagram.svg')),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ) : Container(),
                      const SizedBox(
                        width: 10,
                      ),
                      socialMedia['twitter'] !=null?
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          radius: 135,
                          backgroundColor: darkMode
                              ? darkColor.dGreen
                              : lightColor.dGreen,
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              radius: 125,
                              backgroundColor: darkMode
                                  ? darkColor.dWhite
                                  : lightColor.dWhite,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 200,
                                  child: ClipRRect(
                                      child: SvgPicture.asset(
                                          color: darkMode
                                              ? darkColor.dGreen
                                              : lightColor.dGreen,
                                          height: 20,
                                          'assets/social/twitter.svg')),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ) : Container(),
                      const SizedBox(
                        width: 10,
                      ),
                      socialMedia['linkedIn'] !=null?
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          radius: 135,
                          backgroundColor: darkMode
                              ? darkColor.dGreen
                              : lightColor.dGreen,
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              radius: 125,
                              backgroundColor: darkMode
                                  ? darkColor.dWhite
                                  : lightColor.dWhite,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 200,
                                  child: ClipRRect(
                                      child: SvgPicture.asset(
                                          color: darkMode
                                              ? darkColor.dGreen
                                              : lightColor.dGreen,
                                          height: 20,
                                          'assets/social/linkedin.svg')),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ) : Container(),
                      const SizedBox(
                        width: 10,
                      ),
                      socialMedia['youtube'] !=null?
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          radius: 135,
                          backgroundColor: darkMode
                              ? darkColor.dGreen
                              : lightColor.dGreen,
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              radius: 125,
                              backgroundColor: darkMode
                                  ? darkColor.dWhite
                                  : lightColor.dWhite,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 200,
                                  child: ClipRRect(
                                      child: SvgPicture.asset(
                                          color: darkMode
                                              ? darkColor.dGreen
                                              : lightColor.dGreen,
                                          height: 20,
                                          'assets/social/youtube.svg')),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ) : Container(),
                      const SizedBox(
                        width: 10,
                      ),
                      socialMedia['webSite'] !=null?
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          radius: 135,
                          backgroundColor: darkMode
                              ? darkColor.dGreen
                              : lightColor.dGreen,
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              radius: 125,
                              backgroundColor: darkMode
                                  ? darkColor.dWhite
                                  : lightColor.dWhite,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 200,
                                  child: ClipRRect(
                                      child: FaIcon(
                                        FontAwesomeIcons.globe,
                                        color: lightColor.dGreen,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ) : Container(),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  Divider(
                    thickness: 2,
                    color: lightColor.dBackgroud,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25.0),
                      const Text(
                        "Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      const SizedBox(height: 13.0),
                      Text(
                        "${userAddresses['address']},${userAddresses['city']},${userAddresses['state']}",
                        style: TextStyle(color: lightColor.dGrey),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
