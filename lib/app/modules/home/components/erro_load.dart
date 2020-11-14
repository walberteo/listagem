import 'package:flutter/material.dart';

import '../home_controller.dart';

class ErroLoad extends StatelessWidget {
  const ErroLoad({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.cloud_off, size: 29),
        Text('Ops não foi possível carregar \n Tente novamente mais tarde'),
        IconButton(
          icon: Icon(Icons.refresh_outlined),
          onPressed: controller.fetchUsers,
        ),
      ],
    );
  }
}
