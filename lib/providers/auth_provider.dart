import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/auth_repo_imp.dart';

class AuthProvider with ChangeNotifier{
  AuthRepoImp ? _repo;
  AuthProvider(){
    _repo=AuthRepoImp();
  }
  bool _isloading =false;
  bool get isloading=> _isloading;

  String _loadingText="please wait";
  String get loadingText=>_loadingText;
  
  get await_repo => null;
///This function will take data from user.
  Future<String> login({required String email,required String password})async{
    _isloading=true;
    _loadingText="Logging in.......";
    notifyListeners();
   String result ="ok";

try{
final res=await_repo!.login(email: email, password: password);
print(res);

    }catch(e){
      result=e.toString();
 }
 _isloading=false;
    notifyListeners();
 return result;

  }

///This function will take data from user.
  Future<String> register({required String email,required String password})async{
    _isloading=true;
    _loadingText="creating user.......";
    notifyListeners();
   String result ="ok";

try{
final res=await_repo!.register(email: email, password: password);
print(res);

    }catch(e){
      result=e.toString();
 }
 _isloading=false;
    notifyListeners();
 return result;

    
  }
    
  }
