import 'dart:async';

import 'package:bloc_flutter/api.dart';
import 'package:bloc_flutter/bloc/bloc_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_flutter/bloc/blocState.dart';
import 'package:bloc_flutter/homepage.dart';

void main() {
  runApp(CounterPage());
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BlocApi>(create: (_) => BlocApi()),
      BlocProvider<BlocViewModel>(
          create: (BuildContext context) => BlocViewModel()),
    ], child: Homepage());
  }
}
