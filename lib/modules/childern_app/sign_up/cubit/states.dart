
abstract class ChildernRegisterState{}

class ChildernRegisterIntialState extends ChildernRegisterState{}

class ChildernRegisterLoadingState extends ChildernRegisterState{}

class ChildernRegisterSuccesState extends ChildernRegisterState
{}

class ChildernRegisterErrorState extends ChildernRegisterState
{
  final error;

  ChildernRegisterErrorState(this.error);

}
class ChildernCreatUserSuccesState extends ChildernRegisterState
{}

class ChildernCreatUserErrorState extends ChildernRegisterState
{
  final error;

  ChildernCreatUserErrorState(this.error);

}
class ChildernRegisterChangePasswordVisibilityState extends ChildernRegisterState{}
