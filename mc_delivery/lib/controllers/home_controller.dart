import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CarouselController controller = CarouselController();
  var current = 0.obs;

  var imgSlider = [
    "assets/images/Banner1.png",
    "assets/images/Banner2.png",
    "assets/images/Banner8.png",
  ].obs;
}

class MenuController extends GetxController {
  final CarouselController controller = CarouselController();
  var current = 0.obs;
}
