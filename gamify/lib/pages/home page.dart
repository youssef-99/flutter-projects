import 'package:flutter/material.dart';
import '../data.dart';
import 'package:gamify/pages/Widgets/scrollable_games_widget.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  var _deviceHeight;
  var _deviceWidth;
  var _selectedGame;

  @override
  void initState(){
    super.initState();
    _selectedGame = 0;
  }
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _featuredGameWidget(),
          _gradientBoxWidget(),
          _topLayerWidget(),

        ],
      ),
    );
  }
  Widget _featuredGameWidget(){
    return SizedBox(
      height: _deviceHeight * 0.50,
      width: _deviceWidth,
      child: PageView(
        onPageChanged: (_index){
          setState(() {
            _selectedGame = _index;
          });
        },
        scrollDirection: Axis.horizontal,
        children: featuredGames.map((_game){
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_game.coverImage.url)
                )
            ),
          );
        }).toList(),
      )
    );
  }

  Widget _gradientBoxWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight * 0.8,
        width: _deviceWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(35, 45, 59, 1.0),
              Colors.transparent,
            ],
            stops: [0.65,1],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter
          )
        ),
      ),
    );
  }
  Widget _topLayerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth*0.05, vertical: _deviceHeight * 0.005),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _topBarWidget(),
          SizedBox(
            height: _deviceHeight * 0.13,
          ),
          featuredGamesInfoWidget(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
            child: ScrollableGamesWidget(_deviceHeight * 0.24, _deviceWidth, true, games),
          ),
          _bannerWidget(),
          ScrollableGamesWidget(_deviceHeight * 0.22, _deviceWidth, false, games2),
        ],
      ),
    );
  }
  Widget _topBarWidget(){
    return SizedBox(
      height: _deviceHeight*0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(
                width: _deviceWidth * 0.03,
              ),
              Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget featuredGamesInfoWidget(){
    return SizedBox(
      height: _deviceHeight * 0.12,
      width: _deviceWidth,
      child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text(
                featuredGames[_selectedGame].title,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: _deviceHeight * 0.040
                ),
              ),
              SizedBox(
                height: _deviceHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: featuredGames.map((_game){
                  double _circleRaduis = _deviceHeight * 0.004;
                  bool _activeCircle = _game.title == featuredGames[_selectedGame].title;
                  return Container(
                    margin: EdgeInsets.only(right: _deviceWidth * 0.015),
                    height: _circleRaduis * 2,
                    width: _circleRaduis * 2,
                    decoration: BoxDecoration(
                      color: _activeCircle ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(100)
                    ),
                  );
                }).toList(),
              )
            ],
          ),
      );
  }
  Widget _bannerWidget(){
    return Container(
      height: _deviceHeight * 0.13,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(featuredGames[3].coverImage.url)
        )
      ),
    );
  }
}
