// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _textUsuario = TextEditingController();
  final TextEditingController _textSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tela Inicial'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Login"),
              TextField(
                controller: _textUsuario,
                decoration: InputDecoration(hintText: 'Usuário'),
              ),
              TextField(
                controller: _textSenha,
                decoration: InputDecoration(hintText: 'Senha'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    String data = _textUsuario.text + _textSenha.text;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(data: data)));
                  },
                  child: Text('Acessar'))
            ],
          ),
        ));
  }
}

// class DetailScreen extends StatelessWidget {
//   final String data;

//   DetailScreen({required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tela de Detalhes'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Dados recebidos: '),
//             Text(
//               data,
//               style: TextStyle(fontSize: 20),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  final String data;

  HomePage({required this.data});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = '';

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final response = await http.get(
          Uri.parse('http://localhost:5026/api/login?login=${widget.data}'));

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData) {
        setState(() {
          message = 'Usuario logado com sucesso';
        });
      } else {
        setState(() {
          message = 'USUARIO INVALIDO';
        });
      }
    } catch (e) {
      setState(() {
        message = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
