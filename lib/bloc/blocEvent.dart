abstract class BlocEvent {}

class FetchEvent extends BlocEvent {}

class TestState extends BlocEvent {
  final String test;

  TestState(this.test);
}
