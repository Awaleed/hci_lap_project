import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data/food_data_source.dart';
import '../models/food.dart';
import '../routes/router.gr.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({
    Key key,
    this.food,
  }) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: CachedNetworkImageProvider(food.image), fit: BoxFit.cover),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.smallest.height / constraints.smallest.width > .7) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: .7,
                    child: _buildFood(context),
                  ),
                  SizedBox(
                    height: constraints.smallest.height * .8,
                    child: _buildMore(context),
                  ),
                ],
              ),
            );
          } else
            return Row(
              children: [
                Expanded(
                  child: _buildFood(context),
                ),
                Expanded(
                  child: _buildMore(context),
                ),
              ],
            );
        },
      ),
    );
  }

  Container _buildFood(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(width: .5),
        borderRadius: BorderRadius.circular(25),
        color: Colors.white70,
      ),
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
                items: List.generate(
                    5,
                    (index) => Container(
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://source.unsplash.com/random?${food.name}',
                            fit: BoxFit.cover,
                          ),
                        )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        food.name,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.black),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     _buildTag('Fat', food.fat),
                      //     _buildTag('Saturates', food.saturates),
                      //     _buildTag('Sugar', food.sugar),
                      //     _buildTag('Salt', food.salt),
                      //   ],
                      // ),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
                      Row(
                        children: [
                          Text(
                            '${food.price}\$',
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                          ),
                          RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                            color: Color(0xffF8A22F),
                            padding: EdgeInsets.all(20),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                                VerticalDivider(),
                                Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildMore(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(width: .5),
          color: Colors.white70,
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildCard(context, randomFood)),
                Expanded(child: _buildCard(context, randomFood)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildCard(context, randomFood)),
                Expanded(child: _buildCard(context, randomFood)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String name, int value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: .5),
      ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Text.rich(
        TextSpan(
          text: '$name - ',
          children: [
            TextSpan(text: '$value'),
            TextSpan(text: 'g'),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Food food) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: InkWell(
          onTap: () {
            ExtendedNavigator.of(context).push(
              HomeRoutes.foodDetailsPage,
              arguments: FoodDetailsPageArguments(
                food: food,
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: food.image,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.black),
                      ),
                      Expanded(
                        child: Text(
                          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut aliquam purus sit amet luctus venenatis. A diam maecenas sed enim ut sem viverra. Viverra nam libero justo laoreet. Duis convallis convallis tellus id. Nibh tellus molestie nunc non blandit massa enim nec dui.''',
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .overline
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${food.price}\$',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                          ),
                          Spacer(),
                          RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                            color: Color(0xffF8A22F).withOpacity(.2),
                            padding: EdgeInsets.all(20),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Color(0xffF8A22F),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
