import 'package:auto_route/auto_route_annotations.dart';

import '../pages/contact_us.dart';
import '../pages/food_details.dart';
import '../pages/food_menu.dart';
import '../pages/landing.dart';

const HOME_ROUTER_NAME = 'HomeRouter';

@MaterialAutoRouter(
  routesClassName: 'HomeRoutes',
  routes: <AutoRoute>[
    MaterialRoute(page: LandingPage, initial: true),
    MaterialRoute(page: FoodMenuPage),
    MaterialRoute(page: FoodDetailsPage),
    MaterialRoute(page: ContactUsPage),
  ],
)
class $HomeRouter {}
