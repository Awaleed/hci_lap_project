import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routes/router.dart';
import 'routes/router.gr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(fontFamily: GoogleFonts.roboto().fontFamily),
      home: NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({
    Key key,
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;

  GlobalKey<ExtendedNavigatorState> navKey;
  @override
  void initState() {
    super.initState();
    navKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxHeight / constraints.maxWidth > 1) {
            return Column(
              children: [
                Expanded(
                  child: HomeRouterWidget(
                    observerCallBack: () {
                      Timer.run(() {
                        setState(() {});
                      });
                    },
                    navKey: navKey,
                  ),
                ),
                Container(
                  color: Color(0xffF8A22F),
                  height: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _buildNavItems(),
                  ),
                ),
              ],
            );
          } else {
            return Row(
              children: [
                Container(
                  color: Color(0xffF8A22F),
                  width: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _buildNavItems(),
                  ),
                ),
                Expanded(
                  child: HomeRouterWidget(
                    observerCallBack: () {
                      Timer.run(() {
                        setState(() {});
                      });
                    },
                    navKey: navKey,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildNavItems() {
    return [
      IconButton(
        icon: Icon(FontAwesomeIcons.home),
        tooltip: 'Home',
        onPressed: () {
          navKey.currentState
              .pushAndRemoveUntil(HomeRoutes.landingPage, (_) => false);
        },
      ),
      IconButton(
        icon: Icon(FontAwesomeIcons.elementor),
        tooltip: 'Selected Meals',
        onPressed: () {
          navKey.currentState
              .pushAndRemoveUntil(HomeRoutes.foodMenuPage, (_) => false);
        },
      ),
      IconButton(
        icon: Icon(Icons.email),
        tooltip: 'Contact us',
        onPressed: () {
          navKey.currentState
              .pushAndRemoveUntil(HomeRoutes.contactUsPage, (_) => false);
        },
      ),
      if (navKey.currentState?.canPop() ?? false)
        BackButton(
          onPressed: () {
            navKey.currentState?.pop();
          },
        )
      else
        IconButton(
          tooltip: 'Back to home',
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            navKey.currentState
                .pushAndRemoveUntil(HomeRoutes.landingPage, (_) => false);
          },
        )
    ];
  }
}

class HomeRouterWidget extends StatelessWidget {
  const HomeRouterWidget({
    Key key,
    this.observerCallBack,
    this.navKey,
  }) : super(key: key);
  final VoidCallback observerCallBack;
  final GlobalKey<ExtendedNavigatorState> navKey;

  @override
  Widget build(BuildContext context) {
    return ExtendedNavigator(
      name: HOME_ROUTER_NAME,
      key: navKey,
      router: HomeRouter(),
      observers: [MyObserver(observerCallBack)],
    );
  }
}

class MyObserver extends NavigatorObserver {
  final VoidCallback callback;

  MyObserver(this.callback);

  @override
  void didPop(Route route, Route previousRoute) {
    callback();
  }

  @override
  void didPush(Route route, Route previousRoute) {
    callback();
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    callback();
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    callback();
  }

  @override
  void didStartUserGesture(Route route, Route previousRoute) {
    callback();
  }

  @override
  void didStopUserGesture() {
    callback();
  }
}
