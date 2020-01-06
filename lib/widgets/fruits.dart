import 'package:flutter/material.dart';
import 'package:flutter_maps/_routing/routes.dart';
import 'package:flutter_maps/models/fruit.dart';
import 'package:flutter_maps/utils/utils.dart';

class FruitsWidget extends StatefulWidget {
  @override
  _FruitsWidgetState createState() => _FruitsWidgetState();
}

class _FruitsWidgetState extends State<FruitsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: fruits.map((fruit) => _buildFruitCard(fruit)).toList(),
    );
  }

  Widget _buildFruitCard(Fruit fruit) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '$detailsViewRoute',
              arguments: fruit,
            );
          },
          child: Container(
            height: 100.0,
            width: 250.0,
            decoration: BoxDecoration(
              // color: fruit.color,
              image: DecorationImage(
                // image: AssetImage("assets/images/museumrahmat.jpg"),
                image: AssetImage(fruit.imageBack),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [BoxShadow(color: Colors.grey)],
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                new Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Center(
                    child: Text(
                      fruit.price,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: Fonts.primaryFont,
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10.0,
                // ),
                // Padding(
                // new Container(
                //   decoration: BoxDecoration(
                //     color: Colors.black.withOpacity(0.3),
                //   ),
                //   padding: EdgeInsets.only(left: 10.0, right: 10.0),
                //   child: Container(
                //     child: Text(
                //       fruit.name,
                //       style: TextStyle(
                //         fontFamily: Fonts.primaryFont,
                //         color: Colors.white70,
                //         fontSize: 16.0,
                //         fontWeight: FontWeight.w900,
                //       ),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 65.0,
                ),
                InkWell(
                  // onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: 40.0,
                      width: 145.0,
                      decoration: BoxDecoration(
                        color: Color(0XFF558948).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(
                        child: Text(
                          'Details',
                          style: TextStyle(
                            fontFamily: Fonts.primaryFont,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
