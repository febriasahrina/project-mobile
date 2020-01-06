import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_maps/_routing/routes.dart';
import 'package:flutter_maps/models/fruit.dart';
import 'package:flutter_maps/utils/utils.dart';
import 'package:flutter_maps/widgets/rating_bar.dart';

class FruitAppFruitDetails extends StatelessWidget {
  final Fruit fruit;
  const FruitAppFruitDetails({Key key, this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: AssetImage("assets/images/museumrahmat.jpg"),
                image: AssetImage(fruit.imageBack),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 20.0,
                  right: 20.0,
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
                          fontSize: 22.0,
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
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RatingBar(
                          rating: fruit.rating,
                        ),
                        Text(
                          fruit.rating.toString(),
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontFamily: Fonts.primaryFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      child: Text(
                        fruit.desc,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontFamily: Fonts.primaryFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: IconButton(
                icon: Icon(
                  LineIcons.long_arrow_left,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: IconButton(
                icon: Icon(
                  LineIcons.star_o,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '$cartViewRoute');
                },
              ),
            ),
          ),
          // Positioned(
          //   top: MediaQuery.of(context).size.height / 10,
          //   left: MediaQuery.of(context).size.width / 5,
          //   child: Hero(
          //     tag: fruit.image,
          //     child: Image.asset(
          //       fruit.image,
          //       fit: BoxFit.cover,
          //       height: 250.0,
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, bottom: 13.0),
              child: Container(
                decoration: new BoxDecoration(
                    border: Border.all(
                        color: Colors.orange,
                        width: 1,
                        style: BorderStyle.solid)),
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '08.00 - 10.30 WIB',
                  style: TextStyle(
                    color: Colors.orange,
                    fontFamily: Fonts.primaryFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '$tjongafie');
              },
              child: Container(
                height: 60.0,
                // margin: const EdgeInsets.only(left: 50.0),
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: fruit.color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Open',
                    style: TextStyle(
                        fontFamily: Fonts.primaryFont,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
