import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  double _deviceHeight;
  double _deviceWidth;
  Color _primaryColor = Color.fromRGBO(169, 224, 241, 1.0);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: _deviceHeight * 0.60,
          width: _deviceWidth,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _avatarWidget(),
              _textWidget(),
              SizedBox(height: _deviceHeight * 0.1),
              _logoutButton(context)
            ],
          ),
        ),
      ),
    );
  }
  Widget _avatarWidget(){
    double _circleD = _deviceHeight * 0.25;
    return Container(
      height: _circleD,
      width: _circleD,
      decoration: BoxDecoration(
          color: _primaryColor,
          borderRadius: BorderRadius.circular(500),
          image: DecorationImage(
              image: AssetImage('assets/images/main_avatar.png')
          )
      ),
    );
  }
  Widget _textWidget(){
    return Container(
      child: Text(
        "John Doe",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w400,
          color: _primaryColor
        ),
      ),
    );
  }
  Widget _logoutButton(BuildContext _context){
    return MaterialButton(
      height: _deviceHeight * 0.055,
      minWidth: _deviceWidth * 0.38,
      color: Colors.white,
      child: Text (
        "LOG OUT",
        style: TextStyle(
            color: _primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16.0
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: _primaryColor, width: 3)
      ),
      onPressed: (){},
    );
  }
}

