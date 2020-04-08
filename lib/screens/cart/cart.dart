import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kirana_store/data/models/cart.dart';
import 'package:google_fonts/google_fonts.dart';


class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('કાર્ટ', style: Theme.of(context).textTheme.display4),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.title;
    var cart = Provider.of<CartModel>(context);

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        title: Text(
          cart.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle = Theme.of(context).textTheme.display4.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartModel>(
                builder: (context, cart, child) =>
                    Text('\₹${cart.totalPrice}', style: hugeStyle)),
            SizedBox(width: 24),
            RaisedButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('ખરીદવા નું ફંકશન હજુ સપોર્ટ નથી થયું')));
              },
              color: Colors.yellow,
              child: Text('ખરીદો',
                style: GoogleFonts.josefinSans(
                  textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold, height: 1.3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}