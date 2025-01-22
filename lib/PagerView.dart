import 'package:flutter/material.dart';
import 'package:flutter_3d_effect_animation_example/CardItem.dart';

class PagerView extends StatefulWidget {
  const PagerView({Key? key}) : super(key: key);

  @override
  _PagerViewState createState() => _PagerViewState();
}

class _PagerViewState extends State<PagerView> {
  final PageController _pageController = PageController(viewportFraction: 0.70);

  List list = [
    {
      "backgroundImage":
      "https://c4.wallpaperflare.com/wallpaper/979/532/21/video-games-landscape-dauntless-videogame-trees-wallpaper-preview.jpg",
      "hoverImage":
      "assets/character1.png",
    },
    {
      "backgroundImage":
          "https://c4.wallpaperflare.com/wallpaper/565/570/570/among-trees-video-game-art-forest-trees-river-hd-wallpaper-preview.jpg",
      "hoverImage":
          "assets/character2.png",
    },
    {
      "backgroundImage":
          "https://w0.peakpx.com/wallpaper/388/950/HD-wallpaper-horizon-zero-dawn-game-landscape-aloy-mountains-scenery-games.jpg",
      "hoverImage":
          "assets/character3.png",
    },


  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            double value = 1.0;
            if (_pageController.position.haveDimensions) {
              value = _pageController.page! - index;
              value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
            }
            return Center(
              child: Transform.scale(
                scale: value,
                child: Carditem(list[index]["backgroundImage"],
                    list[index]["hoverImage"]),
              ),
            );
          },
        );
      },
    );
  }
}
