import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state.dart';

class StyledTextSelector extends StatelessWidget {
  const StyledTextSelector(
      {Key? key,
      required this.textContent,
      required this.fontSizeValue,
      required this.fontWeightValue,
      required this.fontColor,
      required this.paddingLeft,
      required this.paddingTop,
      required this.paddingRight,
      required this.paddingBottom})
      : super(key: key);

  final String textContent;
  final double fontSizeValue;
  final FontWeight fontWeightValue;
  final Color fontColor;
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            paddingLeft, paddingTop, paddingRight, paddingBottom),
        child: Text(
          textContent,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: fontSizeValue,
              fontWeight: fontWeightValue,
              color: fontColor),
        ),
      ),
    );
  }
}

categoryCard(String imageUrl, String text) {
  return Stack(children: <Widget>[
    InkWell(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.bottomRight,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Image.network(
              imageUrl,
              height: 200,
            ),
          )),
    ),
    StyledTextSelector(
        textContent: text,
        fontSizeValue: 28,
        fontWeightValue: FontWeight.normal,
        fontColor: Colors.black,
        paddingLeft: 20,
        paddingTop: 0,
        paddingRight: 0,
        paddingBottom: 10),
  ]);
}

recomendationsItem({
  required String imageUrl,
  required String title,
  required String price,
}) {
  return InkWell(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0)),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  imageUrl,
                  height: 210,
                )),
            Consumer<ColorModeState>(builder: (context, cart, child) {
              return StyledTextSelector(
                  textContent: title,
                  fontSizeValue: 26,
                  fontWeightValue: FontWeight.normal,
                  fontColor: cart.getItemColor(),
                  paddingLeft: 0,
                  paddingTop: 20,
                  paddingRight: 0,
                  paddingBottom: 10);
            }),
            StyledTextSelector(
                textContent: price,
                fontSizeValue: 20,
                fontWeightValue: FontWeight.w400,
                fontColor: Colors.grey.shade500,
                paddingLeft: 0,
                paddingTop: 0,
                paddingRight: 0,
                paddingBottom: 0),
          ],
        ),
      ),
    ),
  );
}

recommendationsList(List<List> data) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    height: 310,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        ...data.map((params) => recomendationsItem(
              imageUrl: params[0],
              title: params[1],
              price: params[2],
            ))
      ],
    ),
  );
}
