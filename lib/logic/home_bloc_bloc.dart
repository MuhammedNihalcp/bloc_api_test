import 'package:bloc/bloc.dart';
import 'package:bloc_api_test/service/home_service.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial(isApiFetching: false)) {
    on<FetchApiEvent>((event, emit) async{
      emit(HomeBlocState(isApiFetching: true));
      final data = await HomeSerive().getApi();
      emit(HomeBlocState(isApiFetching: false,apiResult: data));
    });
  }
}
