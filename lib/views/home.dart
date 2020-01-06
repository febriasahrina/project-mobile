import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_maps/_routing/routes.dart';
import 'package:flutter_maps/models/fruit.dart';
import 'package:flutter_maps/utils/utils.dart';
import 'package:flutter_maps/widgets/fruits.dart';
import 'package:flutter_maps/map.dart';

class FruitAppHomePage extends StatefulWidget {
  @override
  _FruitAppHomePageState createState() => _FruitAppHomePageState();
}

class _FruitAppHomePageState extends State<FruitAppHomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0; //new
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  //new
  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, //new
          currentIndex: _currentIndex,  //new
          selectedItemColor: Color(0XFF558948),
          unselectedItemColor: Colors.grey.withOpacity(0.6),
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                    fontFamily: Fonts.primaryFont, fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              
              icon: Icon(FontAwesomeIcons.locationArrow),
              title: Text(
                'Location',
                style: TextStyle(
                    fontFamily: Fonts.primaryFont, fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.user),
              title: Text(
                'Profile',
                style: TextStyle(
                    fontFamily: Fonts.primaryFont, fontWeight: FontWeight.bold),
              ),
            )
          ]),

      body: _getBody(_currentIndex), //new
    );
  }

  Widget _getBody(int index)
  {
    switch(index){
      case 0:
        return _buildFirstPage();
      case 1:
        return _buildSecondPage();
      case 2:
        return _buildThirdPage();
    }

    return Center(child: Text("tidak ada halaman"),);
  }

  Widget _buildFirstPage() {
      return ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
            padding: EdgeInsets.only(left: 15.0),
          ),  
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 15.0),
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              IconButton(
                // icon: Icon(FontAwesomeIcons.thLarge),
                icon: Icon(LineIcons.star_o),
                onPressed: () {
                  Navigator.pushNamed(context, '$cartViewRoute');
                },
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Texts.header,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.6),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: TabText.tabText1,
                ),
                Tab(
                  child: TabText.tabText2,
                ),
                Tab(
                  child: TabText.tabText3,
                ),
                Tab(
                  child: TabText.tabText4,
                ),
              ],
            ),
          ),
          Container(
            height: 330.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                new FruitsWidget(),
                new FruitsWidget(),
                new FruitsWidget(),
                new FruitsWidget(),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Texts.subHeader,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: fruits.reversed
                  .map((fruit) => _buildFruitCard(fruit))
                  .toList(),
            ),
          )
        ],
      );
  }

  Widget _buildSecondPage() {
    return MapsSample();
  }

  Widget _buildThirdPage() {
    return Scaffold(
      appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
          backgroundColor: Color(0XFF558948),
      ),
      body:new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.white.withOpacity(0.8)),
          // clipper: getClipper(),
        ),
        Positioned(
          width: 350,
          //l position bta3 l container m3 any momken a7oto kda kda fe stack w a8ayr mkano bra7ty
          top: MediaQuery.of(context).size.height/15,
          child: Column(
            children: <Widget>[
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  //kda l container nafso lono a7mar y3ny lw shelt l stoor aly t7t dh haykon a7mar
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage('assets/images/febria.jpg'),
                  fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(75.0)),
                  //borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(blurRadius: 7.0,color: Colors.black)
                  ]
                ),
              ),
              SizedBox(height: 15,),
              Center(
                child: new Text("Febria Sahrina",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 15,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding:const EdgeInsets.only(left: 40.0)),
                  Center(
                    child: Text(
                      '''
                      febriasahrina@gmail.com
                      081375293049
                      Mahasiswa''',
                      // maxLines: 10,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );       
  }

//Destination Nearby
  Widget _buildFruitCard(Fruit fruit) {
    return Padding(
      padding: const EdgeInsets.only(right: 2.5, left: 10.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 125,
            width: 125,
          ),
          Positioned(
            top: 7.0,
            child: Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10.0),
              shadowColor: Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '$detailsViewRoute',
                    arguments: fruit,
                  );
                },
                child: Container(
                  height: 110.0,
                  width: 125.0,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(fruit.imageBack),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        new Container(
                          margin: EdgeInsets.only(top: 25.0),
                          width: 150.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              fruit.price,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: Fonts.primaryFont,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
