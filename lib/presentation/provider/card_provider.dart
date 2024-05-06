import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


enum CardStatus {like,dislike,ignore}

class CardProvider extends ChangeNotifier{

  final List<String> _urlImages = [];
  bool _isDragging = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0;
  final List<String> _name = [];
  final List<String> _gender=[];

  List<String> get gender => _gender;
  List<String> get urlImages => _urlImages;
  List<String> get name=>_name;
  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;

  CardProvider(){
    resetUsers();
    notifyListeners();
  }

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * x/_screenSize.width;
    notifyListeners();
  }

  void endPosition(){
    _isDragging = false;
    notifyListeners();
    final status = getStatus(force: true);

    if (status!=null){
      Fluttertoast.cancel();
      Fluttertoast.showToast(msg: status.toString().split('.').last.toUpperCase(),
      fontSize: 36);
    }

    switch (status) {
      case CardStatus.ignore:
        ignore();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      case CardStatus.like:
        like();
        break;
      default:
        resetPosition();
    }
    resetPosition();
  }


  double getStatusOacity(){
    
    const delta = 100;
    final pos = max(_position.dx.abs(),_position.dy.abs());
    final opacity = pos/delta;

    return min(opacity,1);
  }
  CardStatus?  getStatus({bool force = false}){
    final x = _position.dx;
    final y = _position.dy;
    final forceIgnore = x.abs()<20;

    if (force){
    const  delta = 100;

    if (x >= delta) {
      return CardStatus.like;
    }else if (x<= -delta){
      return CardStatus.dislike;
    }else if (y <= -delta / 2 && forceIgnore){
      return CardStatus.ignore;
    }
    }else{
      const  delta = 20;

    if (x >= delta) {
      return CardStatus.like;
    }else if (x<= -delta){
      return CardStatus.dislike;
    }else if (y <= -delta / 2 && forceIgnore){
      return CardStatus.ignore;
    }
    }
    return null;
  }


  void like(){
    _angle = 20;
    _position += Offset(2*_screenSize.width, 0);
    _nextCard();
    notifyListeners();
  }

  void dislike(){
    _angle = -20;
    _position -= Offset(2* _screenSize.width, 0);
    _nextCard();
    notifyListeners();
  }

  void ignore(){
    _angle = 0;
    _position -= Offset(0, _screenSize.height);
    _nextCard();
    notifyListeners();
  }

  Future _nextCard() async {
    if(_urlImages.isEmpty) return;

    await Future.delayed(const Duration(milliseconds: 200));
    _urlImages.removeLast();
    resetPosition();
  }

  void resetUsers() {
     
    notifyListeners();
  }

  void resetPosition () {
    _isDragging  = false;
    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }
}