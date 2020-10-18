import 'package:flutter/material.dart';
import 'package:unavu_new/Add_list.dart';
import 'farmer_order_list.dart';
import 'package:unavu_new/flogin/signup.dart';

class FormarMain extends StatefulWidget {
  @override
  _FormarMainState createState() => new _FormarMainState();
}

class _FormarMainState extends State<FormarMain> {
  var val = Value.getData;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        Positioned(
            width: 300.0,
            top: MediaQuery.of(context).size.height / 8,
            left: MediaQuery.of(context).size.width / 11.5,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('images/farm.jpg'),
                ),
                SizedBox(height: 90.0),
                Text(
                  'Sakthi',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Mangadu',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 25.0),
                FloatingActionButton.extended(
                  backgroundColor: const Color(0xff03dac6),
                  foregroundColor: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SOF()),
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add Item'),
                ),
                SizedBox(height: 25.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderList()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(2, 4),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                    child: Text(
                      'Show Orders',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}
