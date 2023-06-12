
class AuthHelpers{

  static checkUserInputs({required String email, required String password}){


    bool validate =false;
    var email;
    if(email.isEmpty || password.isEmpty){
      return false;
    }
     return true;
  }
}