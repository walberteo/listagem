import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/erro_load.dart';
import 'components/item_list.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  var _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        controller.fetchNextUsers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'Lista de Usuários',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: Center(
        child: Observer(builder: (_) {
          if (controller.isloading && controller.users == null)
            return CircularProgressIndicator();
          if (controller.hasError == true && controller.users == null)
            return ErroLoad(controller: controller);
          var list = controller.users;
          return RefreshIndicator(
            onRefresh: controller.fetchUsers,
            child: ListView.builder(
              semanticChildCount: 2,
              controller: _scrollController,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ItemList(list[index]);
              },
            ),
          );
        }),
      ),
    );
  }
}
