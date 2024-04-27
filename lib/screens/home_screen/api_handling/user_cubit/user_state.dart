abstract class UserDateState{}
class UserDateInitialState extends UserDateState{}
class UserDateLoadingState extends UserDateState{}
class UserDateSuccessState extends UserDateState{
  final String msg;
  UserDateSuccessState(this.msg){}
}
class UserDateFailureState extends UserDateState{
  final String error;
  UserDateFailureState(this.error);
}