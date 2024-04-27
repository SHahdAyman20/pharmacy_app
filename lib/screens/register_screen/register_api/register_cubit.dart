import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import'package:http/http.dart' as http;
import 'package:pharmacy_app/api_services/api_services.dart';
import 'package:pharmacy_app/screens/register_screen/register_api/register_state.dart';


class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit():super(RegisterInitialState());
  static RegisterCubit getInstance(context)=>BlocProvider.of(context);


  Future<void> registerUser(String email,String name,String password,String confirm_pass) async {
    try {
      emit(RegisterLoadingState());

      // Perform registration API call
      final response = await http.post(
        Uri.parse(
            '${ApiServices()
                .baseUrl}register'),
        body: {
          'name':name,
          'password': password,
          'email' : email ,
          'password_confirmation':confirm_pass
        },
      );
      debugPrint(">>>>>>>${response.body}");
      // Check if registration was successful
      if (response.statusCode == 401) {
        // Extract message from response
        final message = jsonDecode(response.body)['message'];

        // Emit login success state with message
        emit(RegisterSuccessState(message));
      } else {
        // Emit login error state with error message
        emit(RegisterFailureState('Registration failed'));
        debugPrint("::::::::::::::");
      }
    } catch (e) {
      // Emit login error state with error message
      emit(RegisterFailureState('Error: $e'));
      debugPrint("::::::::::::::$e");

    }
  }}
















//