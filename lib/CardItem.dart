import 'package:flutter/material.dart';
import 'dart:math' as math;

class Carditem extends StatefulWidget {
  final String backgroundImage;
  final String hoverImage;

  const Carditem(this.backgroundImage, this.hoverImage, {super.key});

  @override
  State<Carditem> createState() => _CarditemState();
}

class _CarditemState extends State<Carditem> {
  bool _isRotated = false;

  void _rotate() {
    setState(() {
      _isRotated = !_isRotated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _rotate,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: Matrix4.rotationX(_isRotated ? math.pi / -4 : 0),
        // 30 degrees in radians
        transformAlignment: Alignment.center,
        child: Material(
          elevation: 50.0,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.black,
          type: MaterialType.card,
          borderRadius: BorderRadius.circular(20),
          child: Container(
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    widget.hoverImage,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
