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
  bool _isImageVisible = true;
  final time = 500;

  void _rotate() {
    setState(() {
      _isRotated = !_isRotated;
      _isImageVisible = !_isImageVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _rotate,
      child: Container(
        width: 300,
        height: 600,
        alignment: Alignment.center,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: time),
                curve: Curves.decelerate,
                transform: Matrix4.rotationX(_isRotated ? math.pi / -3.5 : 0),
                // 30 degrees in radians
                transformAlignment: Alignment.center,
                child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 10.0,
                      end: _isRotated ? 50.0 : 10.0,
                    ),
                    duration: Duration(milliseconds: time),
                    builder: (context, elevation, child) {
                      print("Material elevation $elevation");
                      return Container(
                        width: 300,
                        height: 400,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                            image: NetworkImage(widget.backgroundImage),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            /*BoxShadow(
                              color: Colors.black,
                              spreadRadius: _isRotated ? 5:1,
                              blurRadius: _isRotated ? 10:1,
                           //   blurStyle: BlurStyle.solid,
                              offset: Offset(0, elevation / 2),
                            ),*/
                            _isRotated
                                ? BoxShadow(
                                    color: Colors.black.withAlpha(80),
                                    spreadRadius: _isRotated ? 0 : 1,
                                    blurRadius: _isRotated ? 4 : 1,
                                    offset: Offset(4, 30),
                                  )
                                : BoxShadow(),
                            _isRotated
                                ? BoxShadow(
                                    color: Colors.black.withAlpha(120),
                                    spreadRadius: _isRotated ? 0 : 1,
                                    blurRadius: _isRotated ? 8 : 1,
                                    offset: Offset(-4, 30),
                                  )
                                : BoxShadow(),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.black.withAlpha(100),
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: _isImageVisible ? 1.0 : 0.0,
                              duration: Duration(milliseconds: time),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Image.asset(
                                  widget.hoverImage,
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: time),
              curve: Curves.easeIn,
              bottom: _isImageVisible ? 0 : 60,
              left: 0,
              right: 0,
              top: -80,
              child: AnimatedOpacity(
                opacity: _isImageVisible ? 0.0 : 1.0,
                duration: Duration(milliseconds: time),
                child: Image.asset(
                  widget.hoverImage,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
