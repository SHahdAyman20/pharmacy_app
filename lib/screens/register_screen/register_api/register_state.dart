abstract class RegisterState{}
class RegisterInitialState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{
  final String msg;
  RegisterSuccessState(this.msg){}
}
class RegisterFailureState extends RegisterState{
  final String error;
  RegisterFailureState(this.error);
}