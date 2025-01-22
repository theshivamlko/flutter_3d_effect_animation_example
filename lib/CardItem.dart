import 'package:flutter/material.dart';

class Carditem extends StatefulWidget {
  final String backgroundImage;
  final String hoverImage;

  const Carditem(this.backgroundImage, this.hoverImage, {super.key});

  @override
  State<Carditem> createState() => _CarditemState();
}

class _CarditemState extends State<Carditem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(widget.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [

          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withAlpha(100),
            ),
          ),
          Image.asset(
            widget.hoverImage,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
