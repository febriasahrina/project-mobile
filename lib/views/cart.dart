import 'package:flutter/material.dart';
// import 'package:line_icons/line_icons.dart';
import 'package:flutter_maps/models/fruit.dart';
import 'package:flutter_maps/utils/utils.dart';

class FruitAppCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Favorite'),
      centerTitle: true,
      backgroundColor: Color(0XFF558948),
    );

    final cartItems = Column(
      children: <Widget>[
        _buildCartCard(fruits[0], context),
        _buildCartCard(fruits[1], context),
        _buildCartCard(fruits[2], context),
      ],
    );

    final btn = Column(
      children: <Widget>[
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(45.0),
          shadowColor: Colors.white,
        )
      ],
    );

    final body = ListView(
      children: <Widget>[
        appBar,
        // icon,
        SizedBox(
          height: 10.0,
        ),
        cartItems,
        SizedBox(
          height: 20.0,
        ),
        btn,
      ],
    );

    return Scaffold(
      body: body,
    );
  }

  Widget _buildCartCard(Fruit fruit, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Material(
        elevation: 54.0,
        shadowColor: Colors.white70,
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          height: 90.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Image.asset(
              //     fruit.image,
              //     fit: BoxFit.cover,
              //     height: 80.0,
              //   ),
              // ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          fruit.price,
                          style: TextStyle(
                            fontFamily: Fonts.primaryFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        fruit.name,
                        style: TextStyle(
                          fontFamily: Fonts.primaryFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.orange,
                        ),
                        // -1+
                        //   Row(
                        //     children: <Widget>[
                        //       InkWell(
                        //         onTap: () {},
                        //         child: Container(
                        //           height: 20.0,
                        //           width: 20.0,
                        //           decoration: BoxDecoration(
                        //             color: Colors.grey.withOpacity(0.2),
                        //           ),
                        //           child: Center(
                        //             child: Icon(
                        //               Icons.remove,
                        //               color: Colors.grey,
                        //               size: 15.0,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 10.0,
                        //       ),
                        //       Text(
                        //         '1',
                        //         style: TextStyle(fontWeight: FontWeight.bold),
                        //       ),
                        //       SizedBox(
                        //         width: 10.0,
                        //       ),
                        //       InkWell(
                        //         onTap: () {},
                        //         child: Container(
                        //           height: 20.0,
                        //           width: 20.0,
                        //           decoration: BoxDecoration(
                        //             color: Colors.grey.withOpacity(0.2),
                        //           ),
                        //           child: Center(
                        //             child: Icon(
                        //               Icons.add,
                        //               color: Colors.grey,
                        //               size: 15.0,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
