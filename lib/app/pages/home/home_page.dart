import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/pages/details/details_page.dart';
import 'package:getx_test/app/pages/home/home_binding.dart';
import 'package:getx_test/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    setUpHome();
    _controller = Get.find<HomeController>();
    _controller.getGithubUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GitHub Users',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Obx(
        () {
          return _controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _controller.users.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum foi encontrado',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: _controller.users.length,
                      itemBuilder: (context, index) {
                        final user = _controller.users[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 50,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(user.avatarUrl),
                              ),
                            ),
                          ),
                          title: const Text(
                            "usuario",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          subtitle: Text(
                            user.login,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Get.to(() => DetailsPage(username: user.login));
                          },
                        );
                      },
                    );
        },
      ),
    );
  }
}
