import 'package:flutter/material.dart';
import 'package:online_shop_app/pages/home_page/widgets.dart';
import 'package:online_shop_app/pages/home_page/data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: Layout()),
    );
  }
}

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const TopProposition(),
        styledTextSelector(
            'Categories', 26, FontWeight.w700, Colors.black, 15, 20, 0, 0),
        const CategoriesList(),
        styledTextSelector('Recommendations', 26, FontWeight.w700, Colors.black,
            15, 20, 0, 20),
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
        alignment:
            Alignment.bottomLeft, // This aligns the child of the container
        child: Padding(
            padding: EdgeInsets.fromLTRB(35, screenHeight * 0.36, 0,
                0), //some spacing to the child from bottom
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
