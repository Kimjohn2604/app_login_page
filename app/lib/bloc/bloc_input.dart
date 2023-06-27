import 'dart:async';

import '../validations/validations.dart';

class blocInput{
  StreamController _userController = StreamController();
  StreamController _passController =  StreamController();
  Stream get username => _userController.stream;
  Stream get password => _passController.stream;
  bool isValidInfo(String username , String pasword){
    if (!Validation.isValidUser(username)){
      _userController.sink.addError('Tài khoản không hợp lệ');
      return false;
    }
    _userController.sink.add('OK');
    if (!Validation.isValidPass(pasword)){
      _passController.sink.addError('Mật khẩu không hợp lệ');
      return false;
    }
    _passController.sink.add('OK');
    return true;
  }
  void dispose(){
  _userController.close();
  _passController.close();
}
}