import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:news_app/controllers/home/home_controller.dart';
import 'package:news_app/controllers/home/settings_controller.dart';
import 'package:news_app/controllers/home/top_headline_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.lazyPut(
      () => TopHeadlineController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SettingsController(),
      fenix: true,
    );
  }
}
