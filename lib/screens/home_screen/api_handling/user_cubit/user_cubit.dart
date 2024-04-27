import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import'package:http/http.dart' as http;
import 'package:pharmacy_app/api_model/user_model/user_model.dart';
import 'package:pharmacy_app/api_services/api_services.dart';
import 'package:pharmacy_app/screens/home_screen/api_handling/user_cubit/user_state.dart';
import 'package:pharmacy_app/screens/login_screen/login_api/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UserDateCubit extends Cubit<UserDateState>{
  UserDateCubit():super(UserDateInitialState());
  static UserDateCubit getInstance(context)=>BlocProvider.of(context);

  UserData? userModel;
LoginCubit? loginCubit;
  Future<UserData?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedToken = prefs.getString('token');
    if (cachedToken == null) {
      // Token not found, handle accordingly (e.g., return null or throw an error)
      return null;
    }

    try {
      final response = await http.get(
        Uri.parse('${ApiServices().baseUrl}user'),
        headers: {
          'Authorization': cachedToken,
          // 'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> userDataJson = json.decode(response.body);
        userModel=UserData.fromJson(userDataJson);
        print(response.body);
        emit(UserDateSuccessState(""));
      } else {
        emit(UserDateFailureState(""));
      }
    } catch (e) {
      UserDateFailureState(e.toString());
    }
  }


}


////













//