import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirana_store/screens/account/account.dart';
import 'package:kirana_store/screens/catalog/catalog.dart';
import 'package:kirana_store/screens/search/search.dart';
import 'package:provider/provider.dart';
import 'package:kirana_store/data/models/cart.dart';
import 'package:badges/badges.dart';

class Categories extends StatefulWidget {

  Categories({Key key})
      : super(key: key);

  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  PageController controller = PageController(initialPage: 0, keepPage: true, viewportFraction: 0.8);


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('કિરાણા સ્ટોર', style: Theme.of(context).textTheme.display4),
        actions: [
          IconButton(
            icon:  Icon(Icons.search),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Search())),
          ),
          IconButton(
            icon:  Icon(Icons.account_circle),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Account())),
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 100,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 1,
              crossAxisCount: 2,
              children: <Widget>[
                GestureDetector(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyCatalog( categoryTitle: "બ્રેડ",)));
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            child: Image(image: AssetImage("assets/images/butter.png")),
                          ),
                          SizedBox(height: 15),
                          Text("બ્રેડ",
                            style: GoogleFonts.josefinSans(
                              textStyle: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyCatalog( categoryTitle: "નમકીન",)));

                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            child: Image(image: AssetImage("assets/images/chips.png")),
                          ),
                          SizedBox(height: 15),
                          Text("નમકીન",
                            style: GoogleFonts.josefinSans(
                              textStyle: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyCatalog( categoryTitle: "બિસ્કિટ",)));

                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            child: Image(image: AssetImage("assets/images/cookie.png")),
                          ),
                          SizedBox(height: 15),
                          Text("બિસ્કિટ",
                            style: GoogleFonts.josefinSans(
                              textStyle: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyCatalog( categoryTitle: "લોટ",)));

                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            child: Image(image: AssetImage("assets/images/flour.png")),
                          ),
                          SizedBox(height: 15),
                          Text("લોટ",
                            style: GoogleFonts.josefinSans(
                              textStyle: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyCatalog( categoryTitle: "મસાલા",)));

                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            child: Image(image: AssetImage("assets/images/pepper.png")),
                          ),
                          SizedBox(height: 15),
                          Text("મસાલા",
                            style: GoogleFonts.josefinSans(
                              textStyle: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyCatalog( categoryTitle: "તેલ",)));

                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            child: Image(image: AssetImage("assets/images/sunflower-oil.png")),
                          ),
                          SizedBox(height: 15),
                          Text("તેલ",
                            style: GoogleFonts.josefinSans(
                              textStyle: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

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
