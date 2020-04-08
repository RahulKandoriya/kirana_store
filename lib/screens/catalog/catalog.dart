import 'package:flutter/material.dart';
import 'package:kirana_store/screens/search/search.dart';
import 'package:provider/provider.dart';
import 'package:kirana_store/data/models/cart.dart';
import 'package:kirana_store/data/models/catalog.dart';
import 'package:badges/badges.dart';

class MyCatalog extends StatefulWidget {

  final String categoryTitle;

  MyCatalog({Key key, @required this.categoryTitle})
      : super(key: key);


  @override
  _MyCatalogState createState() => _MyCatalogState();

}

class _MyCatalogState extends State<MyCatalog> {

  String get _categoryTitle => widget.categoryTitle;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('$_categoryTitle', style: Theme.of(context).textTheme.display4),
        actions: [
          IconButton(
            icon:  Icon(Icons.search),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Search())),
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
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return _MyListItem(index);
              }
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


class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    return FlatButton(
      onPressed: cart.items.contains(item) ? null : () => cart.add(item),
      splashColor: Theme.of(context).primaryColor,
      child: cart.items.contains(item)
          ? Icon(Icons.check, semanticLabel: 'ADDED')
          : Text('ADD'),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  _MyListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var catalog = Provider.of<CatalogModel>(context);
    var item = catalog.getByPosition(index);
    var textTheme = Theme.of(context).textTheme.title;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              child: Text(item.name, style: textTheme),
            ),
            SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}