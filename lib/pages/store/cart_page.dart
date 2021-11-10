import 'package:flutter/material.dart';
import 'package:online_shop_app/pages/home_page/widgets.dart';
import 'package:online_shop_app/pages/store/constant.dart';
import 'package:online_shop_app/colors/colors.dart';
import 'package:provider/provider.dart';
import '../../state.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorModeState>(builder: (context, cart, child) {
      return Scaffold(
        backgroundColor: cart.getBackgrundColor(),
        body: getBody(),
      );
    });
  }

  Widget getBody() {
    return ListView(
      children: [
        Column(
            children: List.generate(cartList.length, (index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(cartList[index]['img']),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<ColorModeState>(
                            builder: (context, cart, child) {
                          return StyledTextSelector(
                              textContent: 'Suit Versace',
                              fontSizeValue: 22,
                              fontWeightValue: FontWeight.w300,
                              fontColor: cart.getItemColor(),
                              paddingLeft: 50,
                              paddingTop: 10,
                              paddingRight: 0,
                              paddingBottom: 0);
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        Consumer<ColorModeState>(
                            builder: (context, cart, child) {
                          return StyledTextSelector(
                              textContent: 'ref: 52435848',
                              fontSizeValue: 13,
                              fontWeightValue: FontWeight.w300,
                              fontColor: cart.getItemColor(),
                              paddingLeft: 50,
                              paddingTop: 10,
                              paddingRight: 0,
                              paddingBottom: 0);
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        Consumer<ColorModeState>(
                            builder: (context, cart, child) {
                          return StyledTextSelector(
                              textContent: 'size: S',
                              fontSizeValue: 16,
                              fontWeightValue: FontWeight.w300,
                              fontColor: cart.getItemColor(),
                              paddingLeft: 50,
                              paddingTop: 10,
                              paddingRight: 0,
                              paddingBottom: 0);
                        }),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Consumer<ColorModeState>(
                                builder: (context, cart, child) {
                              return StyledTextSelector(
                                  textContent: 'price: \$234',
                                  fontSizeValue: 18,
                                  fontWeightValue: FontWeight.w300,
                                  fontColor: cart.getItemColor(),
                                  paddingLeft: 50,
                                  paddingTop: 10,
                                  paddingRight: 0,
                                  paddingBottom: 0);
                            }),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        })),
        Divider(
          color: grey.withOpacity(0.8),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<ColorModeState>(builder: (context, cart, child) {
                return StyledTextSelector(
                    textContent: 'Delivery',
                    fontSizeValue: 18,
                    fontWeightValue: FontWeight.w300,
                    fontColor: cart.getItemColor(),
                    paddingLeft: 50,
                    paddingTop: 10,
                    paddingRight: 0,
                    paddingBottom: 0);
              }),
              Consumer<ColorModeState>(builder: (context, cart, child) {
                return StyledTextSelector(
                    textContent: 'Standard - Free',
                    fontSizeValue: 18,
                    fontWeightValue: FontWeight.w300,
                    fontColor: cart.getItemColor(),
                    paddingLeft: 50,
                    paddingTop: 10,
                    paddingRight: 0,
                    paddingBottom: 0);
              }),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Consumer<ColorModeState>(builder: (context, cart, child) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: cart.getButtonColor(),
                  borderRadius: BorderRadius.circular(50 / 2)),
              child: Center(
                child: Text(
                  "Buy this".toUpperCase(),
                  style: const TextStyle(
                      color: white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        }),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
