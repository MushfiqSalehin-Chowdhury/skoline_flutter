
import 'package:flutter/material.dart';
import 'navigationPages/home.dart';
import 'navigationPages/friends.dart';
import 'navigationPages/location.dart';



class Homepage extends StatefulWidget {

  @override
  _DashboardScreenState createState() => new _DashboardScreenState();
}

class _DashboardScreenState extends State<Homepage> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new PageView(
        children: [
          new Home("Home screen"),
          new Location("Location screen"),
          new Friends("Friends screen"),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: const Color(0xFF167F67),
        ), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,
                  color: const Color(0xFFFFFFFF),
                ),
                title: new Text(
                  "Home",
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                  ),
                )),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.location_on,
                  color: const Color(0xFFFFFFFF),
                ),
                title: new Text(
                  "Location",
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                  ),
                )),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.people,
                  color: const Color(0xFFFFFFFF),
                ),
                title: new Text(
                  "Friends",
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                  ),
                ))
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }
}