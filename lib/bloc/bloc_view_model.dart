import 'package:bloc_flutter/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_flutter/bloc/blocState.dart';

import 'package:bloc_flutter/bloc/blocEvent.dart';

enum CounterEvent {
  increment,
  decrement,
  error,
}

class BlocViewModel extends Bloc<CounterEvent, int> {
  BlocViewModel() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.error:
        addError(Exception('unsupported event'));
    }
  }
}

class BlocApi extends Bloc<BlocEvent, BlocState> {
  BlocApi() : super(BlocEmpty());

  @override
  BlocState get initialState => BlocLoading();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    Api api = Api();
    if (event is FetchEvent) {
      yield BlocLoading();
      try {
        print("gggg");
        final dynamic getRepoData = await api.getData();
        yield BlocLoaded(getRepoData);
      } catch (_) {
        yield BlocError();
      }
    }
  }
}
