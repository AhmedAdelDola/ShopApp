abstract class loginstates{}

class intiallogin extends loginstates{}
class loginsucess extends loginstates{}
class loginloding extends loginstates{}
class loginerror extends loginstates{
   final String error ;
   loginerror(this.error);
}
class changestate extends loginstates{}
