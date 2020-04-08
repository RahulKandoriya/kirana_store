import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:kirana_store/data/models/cart.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {

  Search({Key key,})
      : super(key: key);


  @override
  _SearchState createState() => _SearchState();

}

class _SearchState extends State<Search> {

  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'આઈટમ શોધો'
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _controller.clear();
            },
          ),
          IconButton(
            icon: Badge(
              badgeContent: Text("${cart.items.length}"),
              child: Icon(Icons.shopping_cart),
            ),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
          SizedBox(width: 10,)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                  ],

                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


