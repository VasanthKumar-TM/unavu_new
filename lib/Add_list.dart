import 'package:flutter/material.dart';
import 'package:unavu_new/farmer/farmer_main_updated.dart';

class SOF extends StatefulWidget {
  @override
  _SOFState createState() => _SOFState();
}

class _SOFState extends State<SOF> {
  var _item;
  var quantity = <TextEditingController>[];
  var price = <TextEditingController>[];
  var cards = <Card>[];
  List<String> _itemlist = ['Brinjal', 'Rice', 'Onion', 'Tomato', 'Potato'];

  Card createCard() {
    var quantityController = TextEditingController();
    var priceController = TextEditingController();
    quantity.add(quantityController);
    price.add(priceController);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Item ${cards.length + 1}'),
          DropdownButton(
            hint: Text('Brinjal'), // Not necessary for Option 1
            value: _item,
            onChanged: (value) {
              setState(() {
                _item = value;
              });
            },

            items: _itemlist.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),
          TextField(
              controller: quantityController,
              decoration:
                  InputDecoration(labelText: 'Available Quantity(in KG\'s)')),
          TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price per KG')),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<PersonEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var name = _item;
      var age = quantity[i].text;
      var job = price[i].text;
      entries.add(PersonEntry(name, age, job));
    }
    Navigator.pop(context, entries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff7892b),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return cards[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Text('Add Another Item'),
              onPressed: () => setState(() => cards.add(createCard())),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfff7892b),
        child: Icon(Icons.done),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormarMainUpdated()),
          );
        },
      ),
    );
  }
}

class PersonEntry {
  final String item;
  final String quantity;
  final String price;

  PersonEntry(this.item, this.quantity, this.price);
  @override
  String toString() {
    return 'Person: name= $item, age= $quantity, study job= $price';
  }
}
