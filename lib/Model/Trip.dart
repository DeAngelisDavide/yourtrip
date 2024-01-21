
class Trip{
  String _title;
  double _transportCost;
  double _hotelCost;
  double _otherCost;
  String? _pathImage;


  Trip(this._title, this._hotelCost, this._otherCost, this._transportCost,this._pathImage);

  String get title => _title;

  setTitle(String value) {
    _title = value;
  }

  double get transportCost => _transportCost;

  setTransportCost(double value) {
    _transportCost = value;
  }

  double get hotelCost => _hotelCost;

  setHotelCost(double value) {
    _hotelCost = value;
  }

  double get otherCost => _otherCost;

  setOtherCost(double value) {
    _otherCost = value;
  }

  String? get pathImage {return _pathImage;}


  setPathImage(String? value) {
    _pathImage = value;
  }

  Map<String, dynamic> toJson() => {
    "title":_title,
    "transportCost":_transportCost,
    "hotelCost":_hotelCost,
    "otherCost":_otherCost,
    "pathImage":_pathImage
  };

  Trip.fromJson(Map<String, dynamic> json)
      : _title=json["title"],
        _transportCost=json["transportCost"],
        _hotelCost=json["hotelCost"],
        _otherCost= json["otherCost"],
        _pathImage= json["pathImage"];

}