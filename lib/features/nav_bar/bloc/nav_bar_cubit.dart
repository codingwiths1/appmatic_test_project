import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarCubit extends Cubit<int>{
  NavBarCubit(): super(0);

  changeState(int index){
    emit(index);
  }
}