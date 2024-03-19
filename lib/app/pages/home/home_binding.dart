import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_test/app/data/repositories/github_repository.dart';
import 'package:getx_test/app/pages/home/home_controller.dart';

setUpHome() {
  Get.put<HomeController>(HomeController(repository: GithubRepository(dio: Dio())));
}
