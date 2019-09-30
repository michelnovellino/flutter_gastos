import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gastos/src/widgets/chart.widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Icon(icon),
    );
  }

  FloatingActionButton _floatingButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }

  Widget _renderBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[_selector(), _expenses(), _graph(context), _list()],
      ),
    );
  }

  Widget _selector() {
    return Container();
  }

  Widget _expenses() {
    return SafeArea(
      child: Column(
        children: <Widget>[Text('title'), Text('subtitle')],
      ),
    );
  }

  Widget _graph(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
        width: _size.width, height: _size.height * 0.40, child: ChartWidget());
  }

  Widget _item(IconData icon, String name, int percent, double value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '$percent% expenses',
        style: TextStyle(color: Colors.blueGrey),
      ),
      trailing: Container(
        child: Text(
           '\$$value',
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.all(5.0),
      ),
    );
  }

  Widget _list() {
    return Expanded(
      child: ListView(children: <Widget>[
        _item(FontAwesomeIcons.shoppingBag, 'Shopping', 5, 144.12)
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _floatingButton(),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _bottomAction(FontAwesomeIcons.history),
                _bottomAction(FontAwesomeIcons.clock),
                SizedBox(
                  width: sqrt1_2,
                ),
                _bottomAction(FontAwesomeIcons.chartPie),
                _bottomAction(Icons.settings)
              ],
            ),
          ),
        ),
        body: Center(
          child: Container(
            child: _renderBody(context),
          ),
        ),
      ),
    );
  }
}
