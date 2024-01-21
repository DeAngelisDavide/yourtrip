import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Trip.dart';

class TripService with ChangeNotifier{
  List<Trip> _trip = [];
  //Need to create the listview
  int _lenght = 0;
  //Need to tell if the element is created or modified
  int _index = -1;

  TripService(){
    SharedPreferences.getInstance().then((value) {
      if(value.containsKey("trips")){
        final tripEncoded = value.getString("trips");
        _trip = (json.decode(tripEncoded!) as List<dynamic>)
            .map<Trip>((item) => Trip.fromJson(item))
            .toList();
      }
      setLenght(_trip.length);
    });

  }

  int get lenght => _lenght;

  void setLenght(int value) {
    _lenght = value;
    notifyListeners();
  }

  Trip? getElement(index){
    if(index >= 0 && index < _lenght)
      return _trip[index];
    return null;
  }

  void setElement(index, Trip element){
    _trip[index].setTitle(element.title);
    _trip[index].setTransportCost(element.transportCost);
    _trip[index].setHotelCost( element.hotelCost);
    _trip[index].setOtherCost(element.otherCost);
    _trip[index].setPathImage(element.pathImage);
    notifyListeners();
    
    SharedPreferences.getInstance().then((value) {
      String tripEncoded = jsonEncode(_trip.map((trip) => trip.toJson()).toList());
      value.setString("trips", tripEncoded);
    });
  }

  void addElement(element){
    _trip.add(element);
    setLenght(_lenght+1);

    SharedPreferences.getInstance().then((value) {
      String tripEncoded = jsonEncode(_trip.map((trip) => trip.toJson()).toList());
      value.setString("trips", tripEncoded);
    });
  }

  void removeElement(index){
    _trip.removeAt(index);
    setLenght(_lenght-1);

    SharedPreferences.getInstance().then((value) {
      String tripEncoded = jsonEncode(_trip.map((trip) => trip.toJson()).toList());
      value.setString("trips", tripEncoded);
    });
  }


  int get index => _index;

  void setIndex(int value) {
    _index = value;
  }

}