import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/food_data_source.dart';
import '../models/food.dart';
import '../routes/router.gr.dart';

class FoodMenuPage extends StatelessWidget {
  const FoodMenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.hardEdge,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                'https://source.unsplash.com/wMzx2nBdeng',
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .2),
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Selected Meals',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      textStyle: Theme.of(context).textTheme.headline1,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      height: 1,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        'https://source.unsplash.com/random?person',
                      ),
                    ),
                    SizedBox(width: 20),
                    Text('by Abdulrahman Waleed'),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .05),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (var i = 0; i < 20; i++)
                      SizedBox(
                        width: 200,
                        child: FoodMenuItemWidget(food: randomFood),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
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
        child: InkWell(
          onTap: () {
            ExtendedNavigator.of(context).push(
              HomeRoutes.foodDetailsPage,
              arguments: FoodDetailsPageArguments(
                food: food,
              ),
            );
          },
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
