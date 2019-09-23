import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final String text;

  // receive data from the FirstScreen as a parameter
  HomePage({Key key, @required this.text}) : super(key: key);


  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();

}

class _MyStatefulWidgetState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[

    Text(
      ' Business',
      style: optionStyle,
    ),
    Text(
      'School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column (
          children: <Widget>[
            _widgetOptions.elementAt(_selectedIndex),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.text
            ),
          )
          ],
        )

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
