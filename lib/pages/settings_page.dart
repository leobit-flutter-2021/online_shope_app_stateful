import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/state.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorModeState>(
      builder: (context, cart, child) {
        return Scaffold(
          backgroundColor: cart.getBackgrundColor(),
          body: Center(
            child: SizedBox(
              width: 330,
              child: SwitchListTile(
                title: Text(
                  "Dark mode",
                  style: TextStyle(fontSize: 27, color: cart.getItemColor()),
                ),
                value: cart.darkModeState(),
                onChanged: (bool value) {
                  cart.changeColorMode();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
