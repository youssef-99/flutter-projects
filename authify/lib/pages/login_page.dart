import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:authify/pages/utils/animations/login_page_animation.dart';
import 'package:authify/pages/logout_page.dart';

class AnimatedLoginPage extends StatefulWidget {
  @override
  _AnimatedLoginPageState createState() => _AnimatedLoginPageState();
}

class _AnimatedLoginPageState extends State<AnimatedLoginPage> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(milliseconds: 400)
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return _loginPage(_controller);
  }
}


// ignore: must_be_immutable
class  _loginPage extends StatelessWidget {
  Color _primaryColor = Color.fromRGBO(125, 191, 211, 1.0);
  Color _secondaryColor = Color.fromRGBO(169, 224, 241, 1.0);
  var _deviceHeight;
  var _deviceWidth;
  AnimationController _controller;
  EnterAnimation _animation;
  _loginPage(_controller){
    _controller = _controller;
    _animation = EnterAnimation(_controller);
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: _deviceHeight * 0.60,
          width: _deviceWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _avatarWidget(),
              SizedBox(height: _deviceHeight * 0.05,),
              _emailTextField(),
              _passwordTextField(),
              SizedBox(height: _deviceHeight * 0.08),
              _loginButton(context)
            ],
          ),
        ),
      ),
    );
  }
  Widget _avatarWidget (){
    double _circleD = _deviceHeight * 0.25;
    return AnimatedBuilder(
      animation: _animation.controller,
      builder: (BuildContext _context, Widget _widget){
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(_animation.circleSize.value, _animation.circleSize.value, 1),
          child: Container(
            height: _circleD,
            width: _circleD,
            decoration: BoxDecoration(
                color: _secondaryColor,
                borderRadius: BorderRadius.circular(500),
                image: DecorationImage(
                    image: AssetImage('assets/images/main_avatar.png')
                )
            ),
          ),
        );
      },
    );
  }
  Widget _emailTextField(){
    return Container(
      width: _deviceWidth * 0.7,
      child: TextField(
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "John@gmail.com",
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          )
        ),
      ),
    );
  }

  Widget _passwordTextField(){
    return Container(
      width: _deviceWidth * 0.7,
      child: TextField(
        cursorColor: Colors.white,
        obscureText: true,
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          )
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext _context){
    return MaterialButton(
      height: _deviceHeight * 0.055,
      minWidth: _deviceWidth * 0.38,
      color: Colors.white,
      child: Text (
        "LOG IN",
        style: TextStyle(
          color: _primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16.0
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: Colors.white)
      ),
      onPressed: (){
        Navigator.pushReplacement(
          _context,
          MaterialPageRoute(
            builder: (BuildContext _context){
              return HomePage();
            }
          )
        );
      },
    );
  }
}
