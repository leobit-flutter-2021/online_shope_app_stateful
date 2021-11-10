import 'package:flutter/material.dart';
import 'package:online_shop_app/pages/home_page/widgets.dart';
import 'package:online_shop_app/pages/home_page/data.dart';
import 'package:provider/provider.dart';

import '../../state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorModeState>(builder: (context, cart, child) {
      return Scaffold(
        backgroundColor: cart.getBackgrundColor(),
        body: const SingleChildScrollView(child: Layout()),
      );
    });
  }
}

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const TopProposition(),
        Consumer<ColorModeState>(builder: (context, cart, child) {
          return StyledTextSelector(
              textContent: 'Categories',
              fontSizeValue: 26,
              fontWeightValue: FontWeight.w700,
              fontColor: cart.getItemColor(),
              paddingLeft: 30,
              paddingTop: 20,
              paddingRight: 0,
              paddingBottom: 0);
        }),
        const CategoriesList(),
        Consumer<ColorModeState>(builder: (context, cart, child) {
          return StyledTextSelector(
              textContent: 'Recommendations',
              fontSizeValue: 26,
              fontWeightValue: FontWeight.w700,
              fontColor: cart.getItemColor(),
              paddingLeft: 30,
              paddingTop: 20,
              paddingRight: 0,
              paddingBottom: 20);
        }),
        recommendationsList(recommendationsData),
      ],
    );
  }
}

class TopProposition extends StatelessWidget {
  const TopProposition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
        height: screenHeight * 0.55,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(topImageUrl))),
        alignment: Alignment.bottomLeft,
        child: Padding(
            padding: EdgeInsets.fromLTRB(35, screenHeight * 0.36, 0, 0),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text('Winter Collection',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 65.0),
                    child: Text('DISCOVER  >',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0)),
                  ),
                ],
              ),
            )));
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ...categoriesData.map(
              (thisCategory) => categoryCard(thisCategory[0], thisCategory[1]))
        ],
      ),
    );
  }
}
