import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:kirana_store/data/models/cart.dart';
import 'package:kirana_store/screens/orderdetails/orderdetails.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {

  Account({Key key,})
      : super(key: key);


  @override
  _AccountState createState() => _AccountState();

}

class _AccountState extends State<Account> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('પ્રોફાયલ', style: Theme.of(context).textTheme.display4),
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

        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("સલીમ પંજવાની",
                      style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("૨, સર્વોદય સોસાયટી\nબસ સ્ટેશન ની પાછળ\nતળાજા",
                      style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal, height: 1.3),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.only(right: 20, top: 10),
                    child: IconButton(
                      onPressed: (){

                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    )
                ),
              )
            ],
          ),
          Divider(height: 4, color: Colors.black),
          SizedBox(height: 15,),
          Text("ઓર્ડર્સ",
            style: GoogleFonts.josefinSans(
              textStyle: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
            ),
          ),
          SizedBox(height: 15,),
          Divider(height: 4, color: Colors.black),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, position){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OrderDetails()));
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        color: Colors.yellow,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[350],
                            blurRadius: 8.0, // has the effect of softening the shadow
                            spreadRadius: 3.0, // has the effect of extending the shadow
                            offset: Offset(
                              3.0, // horizontal, move right 10
                              3.0, // vertical, move down 10
                            ),
                          )
                        ],
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 20,),
                            Text("પાર્લે નું બિસ્કિટ,\nકપાસ નું તેલ, ઘંવ નો લોટ...",
                              style: GoogleFonts.josefinSans(
                                textStyle: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
                              ),
                            ),
                            Spacer(),
                            Text("૧૫/૫/૨૦૨૦\n₹250",
                              style: GoogleFonts.josefinSans(
                                textStyle: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
                              ),
                            ),
                            SizedBox(width: 20,),

                          ],
                        ),
                      )

                  ),
                );
              },

            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


