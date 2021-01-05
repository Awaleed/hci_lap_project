// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/food.dart';
import '../pages/contact_us.dart';
import '../pages/food_details.dart';
import '../pages/food_menu.dart';
import '../pages/landing.dart';

class HomeRoutes {
  static const String landingPage = '/';
  static const String foodMenuPage = '/food-menu-page';
  static const String foodDetailsPage = '/food-details-page';
  static const String contactUsPage = '/contact-us-page';
  static const all = <String>{
    landingPage,
    foodMenuPage,
    foodDetailsPage,
    contactUsPage,
  };
}

class HomeRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(HomeRoutes.landingPage, page: LandingPage),
    RouteDef(HomeRoutes.foodMenuPage, page: FoodMenuPage),
    RouteDef(HomeRoutes.foodDetailsPage, page: FoodDetailsPage),
    RouteDef(HomeRoutes.contactUsPage, page: ContactUsPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LandingPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LandingPage(),
        settings: data,
      );
    },
    FoodMenuPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const FoodMenuPage(),
        settings: data,
      );
    },
    FoodDetailsPage: (data) {
      final args = data.getArgs<FoodDetailsPageArguments>(
        orElse: () => FoodDetailsPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => FoodDetailsPage(
          key: args.key,
          food: args.food,
        ),
        settings: data,
      );
    },
    ContactUsPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ContactUsPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// FoodDetailsPage arguments holder class
class FoodDetailsPageArguments {
  final Key key;
  final Food food;
  FoodDetailsPageArguments({this.key, this.food});
}
