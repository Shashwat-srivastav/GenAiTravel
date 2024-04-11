import 'package:get/get.dart';

// ignore: camel_case_types
class Schedule extends GetxController
{

  RxInt Rooms = 0.obs;
  RxInt Adults=0.obs;
  RxInt children = 0.obs;
  RxInt Infants = 0.obs;

  void addRoom()
  {
    Rooms.value++;
  }
  void addAdults() {
    Adults.value++;
  }
    void addchildren() {
    children.value++;
  }

  void addInfants() {
    Infants.value++;
  }

  void removeRoom() {
    Rooms.value--;
  }

  void removeAdults() {
    Adults.value--;
  }

  void removechildren() {
    children.value--;
  }

  void removeInfants() {
    Infants.value--;
  }

}