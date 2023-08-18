part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

class LocationPermissionNotGranted extends LocationState {}

class LocationPermissionGranted extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  String location;

  LocationLoaded({required this.location});

  @override
  List<Object> get props => [location];
}
