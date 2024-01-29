import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  String? _playerId;
  String? _age;
  bool? _isAddedPlayer=false;

  String? get playerId => _playerId;
  String? get age => _age;
  bool? get isAddedPlayer => _isAddedPlayer;

  void setPlayerId(String playerId) {
    _playerId = playerId;
    notifyListeners();
  }
  void setAge(String age) {
    _age = age;
    notifyListeners();
  }
  void setIsAddedPlayer(bool isAddedPlayer) {
    _isAddedPlayer = isAddedPlayer;
    notifyListeners();
  }
}