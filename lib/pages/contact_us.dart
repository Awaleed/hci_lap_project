import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/food.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxHeight / constraints.maxWidth > 1) {
            return Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/contact_us_bg.png'),
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact us',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffF8A22F),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              height: 5,
                              width: 100,
                            ),
                          ],
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * .6),
                        child: AspectRatio(
                          aspectRatio: .8,
                          child: Card(
                            elevation: 10,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: Color(0xffF8A22F),
                            child: Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          12,
                                        ),
                                      ),
                                      hintText: 'Name',
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          12,
                                        ),
                                      ),
                                      hintText: 'E-mail',
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextField(
                                    minLines: 5,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          12,
                                        ),
                                      ),
                                      hintText: 'Message',
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  FlatButton(
                                    color: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 100,
                                      vertical: 40,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ),
                                    ),
                                    child: Text(
                                      'Send',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffF8A22F),
                                      ),
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/contact_us_bg.png'),
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact us',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF8A22F),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          height: 5,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  width: 500,
                  height: MediaQuery.of(context).size.height,
                  left: 100,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 200, bottom: 10),
                    child: AspectRatio(
                      aspectRatio: .8,
                      child: Card(
                        elevation: 10,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        color: Color(0xffF8A22F),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  hintText: 'Name',
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  hintText: 'E-mail',
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                minLines: 5,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  hintText: 'Message',
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              SizedBox(height: 20),
                              FlatButton(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 100,
                                  vertical: 40,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),
                                child: Text(
                                  'Send',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffF8A22F),
                                  ),
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class FoodMenuItemWidget extends StatelessWidget {
  final Food food;

  const FoodMenuItemWidget({Key key, @required this.food}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        color: Colors.white54,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                      elevation: 10,
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(100),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(food.image),
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  food.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  '${food.calories} calories',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontSize: 10),
                        ),
                        Text(
                          '${food.time} mins',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Portion',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontSize: 10),
                        ),
                        Text(
                          '${food.portions} persons',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
