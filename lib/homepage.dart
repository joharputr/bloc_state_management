import 'package:bloc_flutter/bloc/blocEvent.dart';
import 'package:bloc_flutter/bloc/blocState.dart';
import 'package:bloc_flutter/bloc/bloc_view_model.dart';
import 'package:bloc_flutter/stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    context.read<BlocApi>().add(FetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Counter')),
        body: BlocBuilder<BlocViewModel, int>(
          builder: (context, count) {
            return Center(
              child: Column(
                children: [
                  Text('$count', style: Theme.of(context).textTheme.headline1),
                  BlocBuilder<BlocApi, BlocState>(
                    builder: (context, state) {
                      if (state is BlocLoading) {
                        return CircularProgressIndicator();
                      } else if (state is BlocLoaded) {
                        return Text(state.data);
                      } else if (state is BlocError) {
                        return Text(state.toString());
                      } else if (state is BlocTest) {
                        return FlatButton(
                          color: Colors.green,
                          child: Text("sdd"),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => StreamBuilder1()));
                          },
                        );
                      }
                      return Container();
                    },
                  )
                ],
              ),
            );
          },
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    context.read<BlocViewModel>().add(CounterEvent.increment);
                    context.read<BlocApi>().add(TestState("test"));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
