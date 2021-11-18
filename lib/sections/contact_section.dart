import 'package:flutter/material.dart';
import 'package:web_app/components/default_button.dart';
import 'package:web_app/components/section_title.dart';
import 'package:web_app/constants.dart';


class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // this height only for demo
      // height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 2.5),
          SectionTitle(
            title: "Contact Me",
            subTitle: "For Project inquiry and information",
            color: Color(0xFF07E24A),
          ),
          ContactBox()
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1110),
      margin: EdgeInsets.only(top: kDefaultPadding * 2),
      padding: EdgeInsets.all(kDefaultPadding * 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocalCard(
                color: Color(0xFFD9FFFC),
                iconSrc: "assets/images/skype.png",
                name: 'TheFlutterWay',
                press: () {},
              ),
              SocalCard(
                color: Color(0xFFE4FFC7),
                iconSrc: "assets/images/whatsapp.png",
                name: 'TheFlutterWay',
                press: () {},
              ),
              SocalCard(
                color: Color(0xFFE8F0F9),
                iconSrc: "assets/images/messanger.png",
                name: 'TheFlutterWay',
                press: () {},
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 2),
          ContactForm(),
        ],
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Your Name",
                hintText: "Enter Your Name",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Email Address",
                hintText: "Enter your email address",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Project Type",
                hintText: "Select Project Type",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Project Budget",
                hintText: "Select Project Budget",
              ),
            ),
          ),
          SizedBox(
            // height: 300,
            // TextField by default cover the height, i tryed to fix this problem but i cant
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "Write some description",
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/contact_icon.png",
                text: "Contact Me!",
                press: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}


class SocalCard extends StatefulWidget {
  const SocalCard({
    Key key,
    this.iconSrc,
    this.name,
    this.color,
    this.press,
  }) : super(key: key);

  final String iconSrc, name;
  final Color color;
  final Function press;

  @override
  _SocalCardState createState() => _SocalCardState();
}

class _SocalCardState extends State<SocalCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding / 2,
            horizontal: kDefaultPadding * 1.5,
          ),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [if (isHover) kDefaultCardShadow],
          ),
          child: Row(
            children: [
              Image.asset(
                widget.iconSrc,
                height: 80,
                width: 80,
              ),
              SizedBox(width: kDefaultPadding),
              Text(widget.name),
            ],
          ),
        ),
      ),
    );
  }
}
