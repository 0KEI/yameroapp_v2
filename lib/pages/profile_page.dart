import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yameroapp/components/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //usuario
  final currentUser = FirebaseAuth.instance.currentUser!;

  //editar
  Future<void> editField(String field) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          title: Text("Página de perfil"),
          backgroundColor: Colors.deepOrange.shade500),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          // Foto de perfil
          const Icon(
            Icons.person,
            size: 72,
          ),

          const SizedBox(height: 10),
          // Correo
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700]),
          ),

          const SizedBox(height: 10),

          // Informacion del usuario
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Información',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Nombre de usuario
          MyTextBox(
              text: '',
              sectionName: 'Nombre de Usuario',
              onPressed: () => editField('Nombre de Usuario')),
          const SizedBox(height: 10),
          // Detalles
          MyTextBox(
              text: '',
              sectionName: 'Nombre(s)',
              onPressed: () => editField('Nombre(s)')),

          //Publicaciones
          const SizedBox(height: 10),

          MyTextBox(
              text: '',
              sectionName: 'Apellidos',
              onPressed: () => editField('Apellidos')),

          const SizedBox(height: 10),

          MyTextBox(
              text: '',
              sectionName: 'Edad',
              onPressed: () => editField('Edad')),
          const SizedBox(height: 10),
          MyTextBox(
              text: '',
              sectionName: 'Telefono',
              onPressed: () => editField('Telefono')),

          const SizedBox(height: 10),

          MyTextBox(
              text: '',
              sectionName: 'Detalles',
              onPressed: () => editField('Detalles')),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
