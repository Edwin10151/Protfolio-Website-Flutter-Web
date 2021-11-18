import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_app/constants.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(maxHeight: 900, minHeight: 700),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/background2.jpg"),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        width: 1200,
        child: Stack(
          children: [
            BlurBox(size: size),
            Positioned(
                bottom: 300,
                right: 0,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 1000, maxHeight: 1800),
                  child: Image.asset("assets/images/mainpic.png"),
                )),
            Positioned(
              bottom: 0,
              child: Menu(),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonPic extends StatelessWidget {
  const PersonPic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 700, maxHeight: 1200),
      child: Image.asset("assets/images/mainpic.png"),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  int hoverIndex = 0;
  List<String> menuItems = [
    "About",
    "Hobbiees",
    "Recent Work",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          menuItems.length,
          (index) => buildMenuItem(index),
        ),
      ),
    );
  }

  Widget buildMenuItem(int index) => InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        onHover: (value) {
          setState(() {
            value ? hoverIndex = index : hoverIndex = selectedIndex;
          });
        },
        child: Container(
          constraints: BoxConstraints(minWidth: 122),
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                menuItems[index],
                style: TextStyle(fontSize: 20, color: kTextColor),
              ),
              // Hover
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom:
                    selectedIndex != index && hoverIndex == index ? -20 : -32,
                child: Image.asset("assets/images/Hover.png"),
              ),
              // Select
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom: selectedIndex == index ? -2 : -32,
                child: Image.asset("assets/images/Hover.png"),
              ),
            ],
          ),
        ),
      );
}

class BlurBox extends StatelessWidget {
  const BlurBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        GlassContent(size: size),
        Spacer(flex: 3),
      ],
    );
  }
}

class GlassContent extends StatelessWidget {
  const GlassContent({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          constraints:
              BoxConstraints(maxWidth: 1110, maxHeight: size.height * 0.7),
          width: double.infinity,
          color: Colors.white.withOpacity(0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi! I Am",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white),
              ),
              Text(
                "Edwin \nTing",
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              Text(
                "",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
