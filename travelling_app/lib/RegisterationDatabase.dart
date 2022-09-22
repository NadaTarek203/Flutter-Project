class RegisterationDatabase{
  late String _email;
  late String _pass;
  late String _conPass;
  RegisterationDatabase(dynamic obj){
    _email=obj['email'];
    _pass=obj['pass'];
    _conPass=obj['conPass'];
  }
  RegisterationDatabase.fromMap(Map<String,dynamic>data){
    _email=data['email'];
    _pass=data['pass'];
    _conPass=data['conPass'];
  }
  Map<String,dynamic> toMap()=>{'email':_email,'pass':_pass,'conPass':_conPass};
      String get email=>_email;
  String get pass=>_pass;
  String get conPass=>_conPass;
}