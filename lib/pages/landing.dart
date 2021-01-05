import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text.rich(
                          TextSpan(
                            text: 'Have no time\nto prepare ',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(color: Colors.black),
                            children: [
                              TextSpan(
                                style: TextStyle(color: Color(0xffF8A22F)),
                                text: 'food',
                                children: [
                                  TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    text: '?',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(height: 20),
                      FittedBox(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * .3,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              'Choose one of our plans,\nenter delivery time and enjoy delicious food\nwithout leaving your home!',
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      RaisedButton(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Order now...',
                            maxLines: 1,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        color: Color(0xffF8A22F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.instagram,
                          color: Colors.deepOrange,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipPath(
              clipper: CustomClipperImage(),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  'fmB3QgQ-qXs',
                  '880b45lhxCo',
                  'hoUmVcrsCVU',
                ]
                    .map(
                      (id) => Container(
                        width: MediaQuery.of(context).size.width,
                        child: CachedNetworkImage(
                          imageUrl: 'https://source.unsplash.com/$id',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipperImage extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    var firstControlPoint = Offset(55, size.height / 1.4);
    var firstEndPoint = Offset(size.width / 1.8, size.height / 1.2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width - (35), size.height - 95);
    var secondEndPoint = Offset(size.width, size.height / 1);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    // path.lineTo(size.width, size.height );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
