import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:kirana_store/data/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetails extends StatefulWidget {

  OrderDetails({Key key,})
      : super(key: key);


  @override
  _OrderDetailsState createState() => _OrderDetailsState();

}

class _OrderDetailsState extends State<OrderDetails> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ઓર્ડર ની વિગત', style: Theme.of(context).textTheme.display4),
        actions: [
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("૧૫/૫/૨૦૨૦",
                  style: GoogleFonts.josefinSans(
                    textStyle: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
                  ),
                ),
                SizedBox(height: 20,),
                Text("પાર્લે નું બિસ્કિટ(2) - ₹100\nકપાસ નું તેલ(2) - ₹100\nઘંવ નો લોટ(2) - ₹100",
                  style: GoogleFonts.josefinSans(
                    textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal, height: 1.3),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Divider(height: 4, color: Colors.black),
          SizedBox(height: 10,),
          Text("₹300",
            style: GoogleFonts.josefinSans(
              textStyle: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
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


