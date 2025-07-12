import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<List<dynamic>> {
  HomeCubit() : super([]);

  updateList(List<dynamic> products) {
    emit(products);
  }
}
