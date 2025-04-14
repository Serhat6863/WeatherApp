import 'package:weather_app/features/weather/domain/entities/location.dart';

class LocationModel extends Location {
  LocationModel({
    required String name,
    required String region,
    required String country,
    required double lat,
    required double lon,
    required String tzId,
    required int localtimeEpoch,
    required String localtime,
  }) : super(
         name: name,
         region: region,
         country: country,
         lat: lat,
         lon: lon,
         tzId: tzId,
         localtimeEpoch: localtimeEpoch,
         localtime: localtime,
       );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
      tzId: json['tz_id'],
      localtimeEpoch: json['localtime_epoch'],
      localtime: json['localtime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'region': region,
      'country': country,
      'lat': lat,
      'lon': lon,
      'tz_id': tzId,
      'localtime_epoch': localtimeEpoch,
      'localtime': localtime,
    };
  }
}
