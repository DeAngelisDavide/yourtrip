
import 'TripService.dart';

class SingletonTrip {
  static final TripService _instance = TripService();

  static TripService getInstance(){
    return _instance;
  }

  SingletonTrip._internal();
}