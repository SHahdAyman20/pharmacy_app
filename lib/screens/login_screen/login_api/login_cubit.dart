import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/network/network.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitialState());
  // static LoginCubit getInstance(context)=>BlocProvider.of(context);
  //
  String ?cashedToken;
  void login({required String email,required String password}) async {
    emit(LoginLoadingState());
    try{
      final response = await http.post(
        Uri.parse('https://7a5d-197-43-165-63.ngrok-free.app/api/login'),
        body: {
          'password': password,
          'email' : email ,
        },
      );
      if( response.statusCode == 200)
      {

        var data = jsonDecode(response.body);
        print(data);

        cashedToken=data['data'];

        debugPrint("Response is : $data");
        debugPrint("Token is: $cashedToken");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', cashedToken!);
        emit(LoginSuccessState(data['message']));
      }
    }
    catch(e){
      debugPrint("Failed to Login , reason : $e");
      emit(LoginFailureState( e.toString()));

    }

  }
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedToken = prefs.getString('token');
    return cachedToken != null;
  }


}
















//