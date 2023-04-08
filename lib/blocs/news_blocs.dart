import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe/blocs/news_event.dart';
import 'package:globe/blocs/news_states.dart';

import '../repos/repositories.dart';

class NewsBloc extends Bloc<NewsEvent,NewsState> {
  late final NewsRepository _newsRepository;
  NewsBloc(this._newsRepository):super(NewsLoadingState()){
    on<LoadNewsEvent>((event,emit)async{
      emit(NewsLoadingState());
    });
  }


}