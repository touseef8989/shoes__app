class Validator{
  static String? validateEmail(String? email){
    if(email!.isEmpty || !email.contains("@")){
      return 'invalid email';
    }
    return null;
  }

  static String? validatePassword(String? password){
   if(password!.length <6){
    return "password to short";
   }
    return null;
  }
}