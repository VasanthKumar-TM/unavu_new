import 'package:flutter/material.dart';
import 'package:unavu_new/data.dart';
import 'package:unavu_new/SizeConfig.dart';
import 'package:unavu_new/consumer/secondPage.dart';
import 'package:unavu_new/consumer/farmerSelection.dart';
import 'area.dart';
import 'consumerDetail.dart';
import 'package:unavu_new/consumer/consumerRegister.dart';

class ConsumerMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Customer(),
    );
  }
}

String name, phnum, place;

class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  var food = Food.getData;
  var area = Area.getData;
  var consumer = Consumer.getData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 20,
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.red, Colors.blue])),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.filter_list,
              ),
              onPressed: () {},
            ),
          ],
          title: Text(
            'UNA{R}VU',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'QuattrocentoSans',
            ),
          ),
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Container(
                              width: 310,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Search here",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontFamily: 'OpenSans'),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 30,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: food.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                // Second second = new Second(
                                //   food[index]['id'],
                                // );
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => second),
                                // );

                                for (int i = 0; i < area.length; i++) {
                                  if (consumer[0]['area'] == area[i]['name']) {
                                    for (int j = 0; j < food.length; j++) {
                                      if (food[food[index]['id']]['name'] ==
                                          food[j]['name']) {
                                        name = food[j]['farmer'];
                                        phnum = food[j]['phnum'];
                                        place = food[j]['place'];
                                      }
                                    }
                                  }
                                }

                                FarmerSelection select = new FarmerSelection(
                                  food[index]['id'],
                                  name,
                                  phnum,
                                  place,
                                  food[index]['price'],
                                );

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => select),
                                );
                              },
                              child: Card(
                                color: Color(food[index]['color']),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Image.asset(
                                        food[index]['photo'],
                                        fit: BoxFit.contain,
                                        height: 80,
                                        width: 80,
                                      ),
                                      // CircleAvatar(
                                      //   radius: 30.0,
                                      //   backgroundImage:
                                      //       AssetImage(food[index]['photo']),
                                      // ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              food[index]['name'],
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontFamily: 'Alata',
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                margin: EdgeInsets.all(10),
                                elevation:
                                    5.0, // this field changes the shadow of the card 1.0 is default
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
