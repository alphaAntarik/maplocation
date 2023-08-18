import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';
import 'package:maplocation/respiratory/locationrespiratory.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRespiratory locationrespiratory;
  LocationBloc({required this.locationrespiratory}) : super(LocationInitial()) {
    on<GetLocationEvent>((event, emit) async {
      // TODO: implement event handler
      emit(LocationLoading());
      try {
        await locationrespiratory.requestLocationPermission();
        String location = await locationrespiratory.getLocation();
        emit(LocationLoaded(location: location));
      } catch (e) {}
    });
  }
}
