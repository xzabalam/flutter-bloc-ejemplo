import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../block/user/user_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final newUser = User(
                    nombre: 'Xavier', edad: 39, profesiones: ['desarrollador']);

                userBloc.add(ActivateUserEvent(newUser));
              },
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeUserAgeEvent(40));
              },
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add(AddUserProfessionEvent('nueva profession'));
              },
              child: const Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white))),
        ],
      )),
    );
  }
}
