import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_test/app/data/repositories/github_repository.dart';
import 'package:getx_test/app/pages/details/details_controller.dart';

setUpDetails() {
  Get.put<DetailsController>(
    DetailsController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    ),
  );
}
