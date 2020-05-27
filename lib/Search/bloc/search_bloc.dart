import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:bloc/bloc.dart';
import 'package:bus_locator/Search/service/search_service.dart';
import 'package:bus_locator/logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchService _search;

  @override
  SearchState get initialState => SearchInitial();

  SearchBloc() {
    _search = SearchService();
  }

  void onTransition(Transition transition) {
    super.onTransition(transition);
    log("SEARCHSTATE", transition.toString());
  }

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchKeyPress) {
      yield SearchLoading();
      try {
        List<DocumentSnapshot> buses = await _search.fetchBuses(event.input);
        yield SearchSuccess(results: buses);
      } catch (error) {
        yield SearchFailure(error.message);
      }
    } else if (event is SearchDefaults) {
      yield* _mapOnSearchDefaults(event);
    }
  }

  Stream<SearchState> _mapOnSearchDefaults(
      SearchDefaults searchDefaults) async* {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      var latitude = position.latitude;
      var longitude = position.longitude;
      List<Placemark> placemark =
          await Geolocator().placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemark[0];
      List<DocumentSnapshot> buses = await _search.fetchBuses(place.toString());
      yield SearchSuccess(results: buses);
    } catch (error) {
      yield SearchFailure("An error has occurred.");
    }
  }
}
