import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // Lista de trabajos de albañiles
  final List<String> trabajosAlbaniles = [
    'Construcción de muros',
    'Colocación de cerámica',
    'Enlucido de paredes',
    'Instalación de pisos',
    'Reparación de estructuras'
  ];

  // Variable para almacenar la selección actual
  String seleccionActual = 'Construcción de muros';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ya Mero!"),
        backgroundColor: Colors.deepOrange.shade500,
      ),
      drawer: Navbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Text("Iniciaste sesión como: ${user.email!}"),

            // Dropdown menu
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selecciona un trabajo de albañil:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  // DropdownButton para mostrar la lista de trabajos
                  DropdownButton<String>(
                    value: seleccionActual,
                    onChanged: (String? newValue) {
                      setState(() {
                        seleccionActual = newValue!;
                      });
                    },
                    items: trabajosAlbaniles.map((String trabajo) {
                      return DropdownMenuItem<String>(
                        value: trabajo,
                        child: Text(trabajo),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
