import 'package:bloc/bloc.dart';
import 'package:flutter_mvvm/model/User.dart';

class UserBloc extends Bloc<int, ResponseUser>{

  @override
  ResponseUser get initialState => UninitializedUser();

  @override
  Stream<ResponseUser> mapEventToState(int event) async* {
    try{
      yield await ResponseUser.getUserFromApi(event);
    }catch(_){}
  }

}