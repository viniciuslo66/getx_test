import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/pages/details/details_binding.dart';
import 'package:getx_test/app/pages/details/details_controller.dart';

class DetailsPage extends StatefulWidget {
  final String username;

  const DetailsPage({super.key, required this.username});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final DetailsController _controller;

  @override
  void initState() {
    super.initState();
    setUpDetails();
    _controller = Get.find<DetailsController>();
    _controller.getGithubUser(username: widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details User'),
      ),
      body: Obx(
        () {
          return _controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : _controller.githubUser == null
                  ? const Center(child: Text('Nenhum usuário encontrado'))
                  : _builderUserInfo();
        },
      ),
    );
  }

  Widget _builderUserInfo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              _controller.githubUser!.avatarUrl,
              height: 275,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.emoji_people_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text(
              'Nome',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.name ?? 'Sem infernoçãoes',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.short_text_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text(
              'Usuário',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.login.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.grain_outlined,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text(
              'Repositórios públicos',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.publicRepos.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.people_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text(
              'Seguidores',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.followers.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.flag_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text(
              'Local',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.location ?? 'Sem informações',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
