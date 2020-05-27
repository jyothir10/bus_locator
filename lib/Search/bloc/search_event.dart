part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SearchKeyPress extends SearchEvent {
  final String input;
  SearchKeyPress(this.input);
}

class SearchDefaults extends SearchEvent {}
