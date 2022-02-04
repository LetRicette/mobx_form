import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_form/controller.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: controller.setEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "Senha"),
                onChanged: controller.setPassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Observer(
                builder: (_) {
                  return Text(
                    controller.formularioValidado
                        ? "Validado"
                        : "*  Campos não validados",
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Observer(
                  builder: (_) {
                    return ElevatedButton(
                      onPressed: controller.formularioValidado ? () {} : null,
                      child: Text(
                        'Logar',
                        style: TextStyle(
                          color: Colors.pink.shade100,
                          fontWeight: FontWeight.w300,
                          fontSize: 25,
                        ),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
