import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:final_project_app/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class SharePage extends StatefulWidget with NavigationStates {
  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // User card
            BigUserCard(
              cardColor: Color.fromRGBO(51, 83, 176, 1),
              userName: "Elshaday Yoseph",
              userProfilePic: AssetImage(
                "assets/biniprof.PNG",
              ),
              cardActionWidget: SettingsItem(
                icons: Icons.edit,
                iconStyle: IconStyle(
                  withBackground: true,
                  borderRadius: 50,
                  backgroundColor: Color.fromRGBO(51, 83, 176, 1),
                ),
                title: "Modify",
                titleStyle: TextStyle(
                    color: Color.fromRGBO(51, 83, 176, 1),
                    fontWeight: FontWeight.bold),
                subtitle: "Tap to change your info",
                onTap: () {
                  print("OK");
                },
              ),
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.contact_support_sharp,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Color.fromRGBO(51, 83, 176, 1),
                  ),
                  title: 'Contact us',
                  titleStyle: TextStyle(
                    color: Color.fromRGBO(51, 83, 176, 1),
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: "Do you need any help?",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.rate_review_sharp,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Color.fromRGBO(51, 83, 176, 1),
                  ),
                  title: 'Rate us',
                  titleStyle: TextStyle(
                      color: Color.fromRGBO(51, 83, 176, 1),
                      fontWeight: FontWeight.bold),
                  subtitle: "Support Phinder",
                  // trailing: Switch.adaptive(
                  //   value: false,
                  //   onChanged: (value) {},
                  // ),
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Color.fromRGBO(51, 83, 176, 1),
                  ),
                  title: 'About us',
                  titleStyle: TextStyle(
                      color: Color.fromRGBO(51, 83, 176, 1),
                      fontWeight: FontWeight.bold),
                  subtitle: "Learn more about Phinder",
                ),
              ],
            ),
            // SizedBox(
            //   height: 20,
            //   child: Container(
            //     width: double.infinity,
            //     decoration: BoxDecoration(color: Colors.grey),
            //   ),
            // ),
            SizedBox(
                height: 80,
                child: Card(
                  color: Color.fromRGBO(51, 83, 176, 1),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share),
                        color: Colors.white,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Share",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Share the Phinder App today",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              settingsGroupTitleStyle: TextStyle(
                  color: Color.fromRGBO(51, 83, 176, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.exit_to_app_rounded,
                  iconStyle: IconStyle(
                      iconsColor: Color.fromRGBO(51, 83, 176, 1),
                      backgroundColor: Colors.white),
                  title: "Sign Out",
                  titleStyle: TextStyle(
                      color: Color.fromRGBO(51, 83, 176, 1),
                      fontWeight: FontWeight.bold),
                ),

                // SettingsItem(
                //   onTap: () {},
                //   icons: CupertinoIcons.delete_solid,
                //   iconStyle: IconStyle(
                //       iconsColor: Color.fromRGBO(51, 83, 176, 1),
                //       backgroundColor: Colors.white),
                //   title: "Delete account",
                //   titleStyle: TextStyle(
                //     color: Color.fromRGBO(51, 83, 176, 1),
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
