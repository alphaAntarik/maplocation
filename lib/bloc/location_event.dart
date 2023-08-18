part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

//class RequestLocationEvent extends LocationEvent{}
class GetLocationEvent extends LocationEvent {}
