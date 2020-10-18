import 'package:flutter/material.dart';
import 'consumerDetail.dart';
import 'area.dart';
import 'package:unavu_new/data.dart';
import 'secondPage.dart';
import 'package:unavu_new/consumer/consumerRegister.dart';

String name, phnum, place;

int id, amount;

class FarmerSelection extends StatefulWidget {
  FarmerSelection(ids, names, phnums, places, amt) {
    id = ids;
    name = names;
    phnum = phnums;
    place = places;
  }
  @override
  _FarmerSelectionState createState() => _FarmerSelectionState();
}

class _FarmerSelectionState extends State<FarmerSelection> {
  var consumer = Consumer.getData;
  var area = Area.getData;
  var data = Food.getData;

  void Check() {
    for (int i = 0; i < area.length; i++) {
      if (consumer[0]['area'] == area[i]['name']) {
        for (int j = 0; j < data.length; j++) {
          if (data[id]['name'] == data[j]['name']) {
            name = data[j]['farmer'];
            phnum = data[j]['phnum'];
            place = data[j]['place'];
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 250, 1.0),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CustomPaint(
                  painter: pathPainter(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        )),
                    Spacer(),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Choose Farmer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Alata',
                      fontSize: 30.0,
                      color: Colors.green,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Second second = new Second(
                        data[id]['id'],
                        amount,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => second),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 15.0,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.redAccent,
                          size: 35.0,
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Name: ",
                              style: TextStyle(
                                fontFamily: 'RobotoBold',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                fontFamily: 'RobotoLight',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              phnum,
                              style: TextStyle(
                                fontFamily: 'RobotoLight',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              place,
                              style: TextStyle(
                                fontFamily: 'RobotoLight',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

class Farm {
  static final getData = [
    {
      'name': name,
      'phno': phnum,
      'area': place,
    }
  ];
}

class pathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xffE4E2FF);
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.40,
        size.width * 0.58, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.72, size.height * 0.8,
        size.width * 0.92, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.98, size.height * 0.8, size.width, size.height * 0.82);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
