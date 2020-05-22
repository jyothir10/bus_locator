part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState{}
class SearchSuccess extends SearchState{
  final List<DocumentSnapshot> results;
  final String message;
  SearchSuccess({this.message, this.results});
}
class SearchFailure extends SearchState{
  final String message;
  SearchFailure(this.message);
}
