import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/main_widget.dart';
import 'state.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ColorModeState(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FullHomePage(),
      )));
}
