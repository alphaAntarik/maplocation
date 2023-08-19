import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:maplocation/respiratory/locationrespiratory.dart';

import 'bloc/location_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LocationBloc(locationrespiratory: LocationRespiratory()),
      child: MaterialApp(
        title: 'Location App',
        home: LocationScreen(),
      ),
    );
  }
}

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location App'),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) =>
              LocationBloc(locationrespiratory: LocationRespiratory())
                ..add(GetLocationEvent()),
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              if (state is LocationLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${state.location}'),
                    // Text('Longitude: $longitude'),
                  ],
                );
              }
              return CircularProgressIndicator();
              ;
            },
          ),
        ),
      ),
    );
  }
}
