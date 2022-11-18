import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/controller/auth/logOutController.dart';
import 'package:event_mobile_app/controller/userProfile/UserProfileController.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/profileTabBar.dart';
import 'package:event_mobile_app/screen/menu/appNavBar.dart';
import 'package:event_mobile_app/screen/menu/drawer.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:event_mobile_app/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? imageFile;
  bool avatarImageUpdate = false;
  bool coverImageUpdate = false;

  Future<void> _launchInBrowser(String urlNotParse) async {
    Uri url = Uri.parse(urlNotParse);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }


  //Picked image from gallery and upload it to database
  Future pickedMedia(context, String typeImage) async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        typeImage == "avatar"
            ? avatarImageUpdate = true
            : coverImageUpdate = true;
      });
      print("Image file path $imageFile");
      await UserProfileController()
          .addUserProfileImage(context, File(file.path), file.path, typeImage);
      setState(() {
        typeImage == "avatar"
            ? avatarImageUpdate = false
            : coverImageUpdate = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Map userData = Provider.of<AllChangeNotifier>(context).userData;
    Map userPreferences =
        Provider.of<AllChangeNotifier>(context).userPreferences;
    Map socialMedia = jsonDecode(userData['data']['socialNetworks']);
    darkMode = Provider.of<AllChangeNotifier>(context).screenMode;
    var avatarImg = Provider.of<AllChangeNotifier>(context).uploadAvatarImage;
    var coverImg = Provider.of<AllChangeNotifier>(context).uploadCoverImage;
    print("my user avatar ${avatarImg}");
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: darkMode ? darkColor.dBackgroud : lightColor.dBackgroud,
              ),
              child: coverImageUpdate
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CachedNetworkImage(
                      imageUrl: coverImg == ""
                          ? userData['data']["coverImg"]
                          : coverImg,
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
                          Container(),
                    ),
            ),
            Transform.translate(
              offset: const Offset(100.0, -230.0),
              child: SizedBox(
                height: 50,
                width: 170,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    backgroundColor:
                        darkMode ? darkColor.dWhite : lightColor.dWhite,
                  ),
                  onPressed: () async {
                    await pickedMedia(context, "cover");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.panorama,
                        size: 14,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Change Image",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0.0, -120.0),
              child: Container(
                height: 550,
                color: darkMode ? darkColor.dWhite : lightColor.dWhite,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Transform.translate(
                      offset: const Offset(20.0, 0.0),
                      //User profile image section
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Profile photo image
                          SizedBox(
                            height: 130,
                            width: 130,
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
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                      height: 130,
                                      width: 130,
                                      child: CircleAvatar(
                                        backgroundColor: darkMode
                                            ? darkColor.dBackgroud
                                            : lightColor.dBackgroud,
                                        child: avatarImageUpdate
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : CachedNetworkImage(
                                                imageUrl: avatarImg == ""
                                                    ? userData['data']
                                                        ["avatarImg"]
                                                    : avatarImg,
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        CircularProgressIndicator(
                                                            color: lightColor
                                                                .dGreen,
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                errorWidget:
                                                    (context, url, error) =>
                                                         Container(),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //Profile photo image upload button
                          Transform.translate(
                            offset: const Offset(-45.0, 45.0),
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: GestureDetector(
                                child: CircleAvatar(
                                  radius: 135,
                                  backgroundColor: darkMode
                                      ? darkColor.dGreen
                                      : lightColor.sixBackground,
                                  child: Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: CircleAvatar(
                                      radius: 125,
                                      backgroundColor: darkMode
                                          ? darkColor.dBlack
                                          : lightColor.dWhite,
                                      child: const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: SizedBox(
                                          child: FaIcon(FontAwesomeIcons.camera,
                                              color: Colors.black, size: 14.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  await pickedMedia(context, "avatar");
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),
                    //User profile information section
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        userData['data']['username'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        size: 15,
                        color: lightColor.dGreen,
                      )
                    ]),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      userData['data']['email'],
                      style: TextStyle(fontSize: 15.0),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "17",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Follower"),
                          ],
                        ),
                        Divider(),
                        Column(
                          children: const [
                            Text(
                              "0",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Following"),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 25.0),
                    Text(
                      "Hey i am ${userData['data']['username']}",
                      style: TextStyle(color: lightColor.dGrey),
                    ),
                    const SizedBox(height: 25.0),
                    const Text(
                      "Find me on",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const SizedBox(height: 25.0),
                    //Social media icon button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialMedia['facebook'] != "" && socialMedia['facebook'] != null
                            ? SizedBox(
                                width: 40,
                                height: 40,
                                child: GestureDetector(
                                  onTap: () {
                                    _launchInBrowser(socialMedia['facebook']);
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
                                ),
                              )
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
                                ),
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
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0.0, -100.0),
              child:
                  //User profile Tab bar
                  ProfileTabBar(user: userData, preferences: userPreferences),
            ),
            Transform.translate(
              offset: const Offset(0.0, -100.0),
              child: ElevatedButton(
                onPressed: () async {
                  // Logout user
                  await LogOutController().logOut(context);
                },
                child: const Text("Log out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
