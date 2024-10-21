import 'package:fetch_bloc_cubit/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'users_states.dart';
import 'package:dio/dio.dart';


class UsersCubits extends Cubit<UsersState> {
  UsersCubits() : super(const UsersState.initial());

  fetchUsers() async {
    try {
      emit(const UsersState.loading());
      Dio dio = Dio();

      final Response<dynamic> response =
          await dio.get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        final users = response.data.map<User>((e) {
          return User.fromJson(e);
        }).toList();

        emit(UsersState.success(users));
      } else {
        emit(const UsersState.error("Error"));
      }
    } catch (e) {
      emit(const UsersState.error("error"));
    }
  }
}
