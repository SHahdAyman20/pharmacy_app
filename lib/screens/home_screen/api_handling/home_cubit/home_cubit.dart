import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/screens/home_screen/api_handling/home_cubit/home_state.dart';
class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());


  int productNum = 1 ;
  void increment(){
    productNum++;
    emit(UpdateProductNumSuccessState());
  }

  void decrement(){
    if( productNum > 1 )
    {
      productNum--;
    }
    emit(UpdateProductNumSuccessState());
  }




}