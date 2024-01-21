import 'package:yourtrip/Control/TripService.dart';

import '../Control/SingletonCurrecny.dart';
import '../Control/SingletonTrip.dart';
import '../generated/l10n.dart';
import 'Trip.dart';

//Usefull data for the Stats page
class StatsData{
  //Data in the chart
  final Map<String, double> _dataMap = {};
  //Save the result to not do the same operation several times
  final _total = totalCost(0);
  final _transportCost = totalCost(1);
  final _accCost = totalCost(2);
  final _otherCost = totalCost(3);

   StatsData(){
    _dataMap["${S.current.transportCost}: $_transportCost ${SingletonCurrency.getInstance().actualCurrency}"] = _transportCost * 100 / _total;
    _dataMap["${S.current.accommodationCost}: $_accCost ${SingletonCurrency.getInstance().actualCurrency}"] = _accCost * 100 / _total;
    _dataMap["${S.current.otherCost}: $_otherCost ${SingletonCurrency.getInstance().actualCurrency}"] = _otherCost * 100 / _total;
  }


  Map<String, double> get dataMap => _dataMap;

  static double totalCost(int type){
    int index = 0;
    final instance = SingletonTrip.getInstance();
    double sum = 0;
    switch(type){
    //All sum
      case 0:
        while (index < instance.lenght) {
          sum += instance.getElement(index)!.transportCost + instance.getElement(index)!.hotelCost + instance.getElement(index)!.otherCost;
          index++;
        }
        break;
    //sum only of transportCost
      case 1:
        while (index < instance.lenght) {
          sum+=instance.getElement(index)!.transportCost;
          index++;
        }
        break;
    //sum only of hotel cost
      case 2:
        while (index < instance.lenght) {
          sum+=instance.getElement(index)!.hotelCost;
          index++;
        }
        break;
        //sum only other cost
      case 3:
        while (index < instance.lenght) {
          sum+=instance.getElement(index)!.otherCost;
          index++;
        }
        break;
    }
    return sum;
  }

  static Trip? max(){
    TripService instance = SingletonTrip.getInstance();
    if(instance.lenght != 0){
      Trip max = instance.getElement(0)!; double maxValue = max.transportCost+max.hotelCost+max.otherCost;
      Trip newInstance; double newInstanceValue;
      for(var x = 1;  x < instance.lenght; x++){
        newInstance = instance.getElement(x)!;
        newInstanceValue = newInstance.transportCost+newInstance.hotelCost+newInstance.otherCost;
        if( newInstanceValue > maxValue){
          maxValue = newInstanceValue;
          max = newInstance;
        }
      }
      return max;
    } else {
      return null;
    }
  }
  static Trip? min(){
    final instance = SingletonTrip.getInstance();
    if(instance.lenght != 0){
      Trip min = instance.getElement(0)!; double minValue = min.transportCost+min.hotelCost+min.otherCost;
      Trip newInstance; double newInstanceValue;
      for(var x = 1;  x < instance.lenght; x++){
        newInstance = instance.getElement(x)!;
        newInstanceValue = newInstance.transportCost+newInstance.hotelCost+newInstance.otherCost;
        if( newInstanceValue < minValue){
          minValue = newInstanceValue;
          min = newInstance;
        }
      }
      return min;
    } else {
      return null;
    }
  }

  get total => _total;
  
  get transportCost => _transportCost;

  get accCost => _accCost;

  get otherCost => _otherCost;
}