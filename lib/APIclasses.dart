// ignore_for_file: public_member_api_docs, sort_constructors_first



class Place {

  String name;
  String location;
  String img;
  String desc;
  String attract;
  String visitTime;
  String ChildAllow;
  Place({
    required this.name,
    required this.location,
    required this.img,
    required this.desc,
    required this.attract,
    required this.visitTime,
    required this.ChildAllow,
  });
}


class DayWise {

  String item;
  List<String> places;
  DayWise({
    required this.item,
    required this.places,
  });
  
}

String TotalTime ="";

class Hotel {
  String name;
  Hotel({
    required this.name,
  });
}

class EstimateCost {

  String accomodate;
  String activity;
  String food;
  String transport;
  EstimateCost({
    required this.accomodate,
    required this.activity,
    required this.food,
    required this.transport,
  });
}
