import 'package:flutter/material.dart';

enum EnumState { started, initial, loading }

class ControllerState extends ValueNotifier<EnumState> {
  ControllerState() : super(EnumState.initial);

  String contact = 'thiago.carmo.eng@gmail.com';
  String dev = 'Developed by Thiago Augusto';

  chamaPagina({required EnumState state}) {
    value = state;
    switch (value) {
      case EnumState.initial:
        return initial();
      case EnumState.started:
        return staterd();
      case EnumState.loading:
        return loading();
      default:
        return initial();
    }
  }

  initial() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Expanded(
              flex: 1,
              child: Column(
                children: [Text(dev), Text(contact)],
              )),
          const Expanded(
            child: Text(
              'INITIALIZING',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                child: const Text('Loading'),
                onPressed: () => chamaPagina(state: EnumState.loading),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  loading() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Expanded(
              flex: 1,
              child: Column(
                children: [Text(dev), Text(contact)],
              )),
          const Expanded(
              flex: 1, child: Center(child: CircularProgressIndicator())),
          const SizedBox(height: 20),
          const Expanded(
            flex: 1,
            child: Text(
              'LOADING',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton(
              child: const Text('call Home'),
              onPressed: () => chamaPagina(state: EnumState.started),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  staterd() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Expanded(
                flex: 1,
                child: Column(
                  children: [Text(dev), Text(contact)],
                )),
            const Expanded(child: Text('HOME', style: TextStyle(fontSize: 20))),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                child: const Text('Initializing'),
                onPressed: () => chamaPagina(state: EnumState.initial),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
