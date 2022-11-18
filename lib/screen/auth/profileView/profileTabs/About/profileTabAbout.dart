import 'dart:convert';

import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/About/EditProfileForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileTabAbout extends StatefulWidget {
  Map userInfo;

  ProfileTabAbout({Key? key, required this.userInfo}) : super(key: key);

  @override
  State<ProfileTabAbout> createState() => _ProfileTabAboutState();
}

class _ProfileTabAboutState extends State<ProfileTabAbout> {
  _launchURL(String myUrl) async {
    Uri url = Uri(scheme: 'https', host: 'www.cylog.org', path: 'headers/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInBrowser(String urlNotParse) async {
    Uri url = Uri.parse(urlNotParse);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Map userData = widget.userInfo;
    Map userAddresses = jsonDecode(userData['data']["addresses"]);
    Map socialMedia = jsonDecode(userData['data']['socialNetworks']);
    // print("about page ${userData['data']['addresses']}");
    print("instagram page ${socialMedia['instagram']}");
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
                              return EditProfileForm(userData: userData);
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      socialMedia['facebook'] != "" && socialMedia['facebook'] != null
                          ? SizedBox(
                              width: 40,
                              height: 40,
                              child: GestureDetector(
                                onTap: () {
                                  _launchURL(socialMedia['facebook']);
                                },
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
                              ))
                          : Container(),
                      socialMedia['facebook'] != "" && socialMedia['facebook'] != null ? const SizedBox(
                        width: 10,
                      ) : Container(),
                      socialMedia['instagram'] != "" && socialMedia['instagram'] != null
                          ? SizedBox(
                              width: 40,
                              height: 40,
                              child: GestureDetector(
                                onTap: () {
                                  _launchInBrowser(socialMedia['instagram']);
                                },
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
                              ),
                            )
                          : Container(),
                      socialMedia['instagram'] != "" && socialMedia['instagram'] != null ? const SizedBox(
                        width: 10,
                      ) : Container(),
                      socialMedia['twitter'] != "" && socialMedia['twitter'] != null
                          ? SizedBox(
                              width: 40,
                              height: 40,

                          child: GestureDetector(
                            onTap: () {
                              _launchInBrowser(socialMedia['twitter']);
                            },
                            child:CircleAvatar(
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
                              )),
                            )
                          : Container(),
                      socialMedia['twitter'] != "" && socialMedia['twitter'] != null ? const SizedBox(
                        width: 10,
                      ) : Container(),
                      socialMedia['linkedIn'] != "" && socialMedia['linkedIn'] != null
                          ? SizedBox(
                              width: 40,
                              height: 40,
                              child: GestureDetector(
                                onTap: () {
                                  _launchInBrowser(socialMedia['linkedIn']);
                                },
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
                              ),
                            )
                          : Container(),
                      socialMedia['linkedIn'] != "" && socialMedia['linkedIn'] != null ? const SizedBox(
                        width: 10,
                      ) : Container(),
                      socialMedia['youtube'] != "" && socialMedia['youtube'] != null
                          ? SizedBox(
                              width: 40,
                              height: 40,
                              child: GestureDetector(
                                onTap: () {
                                  _launchInBrowser(socialMedia['youtube']);
                                },
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
                              ),
                            )
                          : Container(),
                      socialMedia['youtube'] != "" && socialMedia['youtube'] != null ? const SizedBox(
                        width: 10,
                      ) : Container(),
                      socialMedia['webSite'] != "" && socialMedia['webSite'] != null
                          ? SizedBox(
                              width: 40,
                              height: 40,
                              child: GestureDetector(
                                onTap: () {
                                  _launchInBrowser(socialMedia['webSite']);
                                },
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
                              ),
                            )
                          : Container(),
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
                      address(userAddresses['address'] ?? "",userAddresses['city'] ?? "",userAddresses['secondAddress'] ?? "",userAddresses['country'] ?? "",userAddresses['state'] ?? "",userAddresses['zip'] ?? ""),
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

  address(String address, String city, String secondAddress, String country, String state, String zip){
    var cityVal = city.isEmpty || address.isEmpty && secondAddress.isEmpty && zip.isEmpty && state.isEmpty && country.isEmpty  ? "" : "$city ,";
    var addressVal = address.isEmpty || secondAddress.isEmpty && zip.isEmpty && state.isEmpty && country.isEmpty  ? "" : "$address, ";
    var secondAddressVal = secondAddress.isEmpty || zip.isEmpty && state.isEmpty && country.isEmpty ? "" : "$secondAddress, ";
    var zipVal = zip.isEmpty || state.isEmpty && country.isEmpty? "" : "$zip, ";
    var countryVal = country.isEmpty || state.isEmpty ? "" : "$country, ";
    return Text(
      "$cityVal $addressVal $secondAddressVal $zipVal $countryVal $state",
      style: TextStyle(color: lightColor.dGrey),
    );
  }
}
