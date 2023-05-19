

abstract class ChildernLoginState{}

class ChildernLoginIntialState extends ChildernLoginState{}

class ChildernLoginLoadingState extends ChildernLoginState{}

class ChildernLoginSuccesState extends ChildernLoginState
{
final String uId;

  ChildernLoginSuccesState(this.uId);
}

class ChildernLoginErrorState extends ChildernLoginState
{
  final error;

  ChildernLoginErrorState(this.error);

}
class ChildernChangePasswordVisibilityState extends ChildernLoginState{}
