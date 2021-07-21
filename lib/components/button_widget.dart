import 'package:flutter/material.dart';

class ButtonHeaderWidget extends StatelessWidget {
    final double width;
    final double height;

  final double marginIndex;
  final String title;
  final String text;
  final VoidCallback onClicked;

  const ButtonHeaderWidget({
    Key key,
    @required this.title,
    @required this.width,
    @required this.height,
    @required this.marginIndex,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => HeaderWidget(
        title: title,
        child: ButtonWidget(
          marginIndex: marginIndex,
          width:width,
          height:height,
          title: title,
          text: text,
          onClicked: onClicked,
        ),
      );
}

class ButtonWidget extends StatelessWidget {
  final String title;
  final double marginIndex;
final double width;
    final double height;
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    @required this.width,
    @required this.height,
    @required this.marginIndex,
    @required this.title,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.only(bottom: this.marginIndex),
      width: this.width,
      height: this.height,
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: this.title,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelStyle: TextStyle(color: Colors.blue[600], fontSize: 16.0),
            floatingLabelBehavior: FloatingLabelBehavior.always),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(60),
            primary: Colors.transparent,
            elevation: 0,
          ),
          child: FittedBox(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.blue[600]),
            ),
          ),
          onPressed: onClicked,
        ),
      ));
}

class HeaderWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const HeaderWidget({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w100,
            ),
          ),
          child,
        ],
      );
}
