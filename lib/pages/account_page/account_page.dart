import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_shop_app/pages/account_page/links.dart';
import 'package:provider/provider.dart';

import '../../state.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  File? image;
  Future getImage() async {
    final image = await ImagePicker.platform.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorModeState>(builder: (context, cart, child){
      return Scaffold(
      backgroundColor: cart.getBackgrundColor(),
      body: getBody(),
    );
    });

  }

  Widget getBody() {
    return ListView(
        children: [
          Consumer<ColorModeState>(builder: (context, cart, child) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: image != null ? Image.file(image!, width:130, height: 130, fit: BoxFit.cover) : Image.network(profileUrl, width:130, height: 130, fit: BoxFit.cover),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Joe Wittenbreder",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400, color: cart.getItemColor()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "2-year member",
                          style: TextStyle(fontSize: 13, color: cart.getItemColor().withOpacity(0.7))
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.white,
                            backgroundColor: cart.getButtonColor(),
                          ),
                          onPressed: getImage,
                          child: const Text('Set another image',
                              style: TextStyle(fontSize: 20, color: Colors.white))
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
          const SizedBox(
            height: 40,
          ),
          Consumer<ColorModeState>(builder: (context, cart, child) {
            return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.shopping_basket, size: 30, color: cart.getItemColor()),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Orders",
                      style: TextStyle(fontSize: 17, color: cart.getItemColor()),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_sharp, size: 30, color: cart.getItemColor()),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "My Address",
                      style: TextStyle(fontSize: 17, color: cart.getItemColor()),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.settings, size: 30, color: cart.getItemColor()),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(fontSize: 17, color: cart.getItemColor()),
                    )
                  ],
                ),
              ],
            ),
          );
          }),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer<ColorModeState>(builder: (context, cart, child){
            return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    children: List.generate(accountList.length, (index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Text(
                                        accountList[index],
                                        style: TextStyle(fontSize: 16, color: cart.getItemColor()),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: cart.getItemColor().withOpacity(0.5),
                                        size: 17,
                                      )

                                    ]
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Divider(
                                  color: Colors.grey.withOpacity(0.8),
                                )
                              ]
                          )
                      );
                    }
                    )
                )
            );
          })//here
        ]
    );
  }
}
