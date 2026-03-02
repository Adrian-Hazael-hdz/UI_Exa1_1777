import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      // Se eliminó el AppBar para seguir el boceto No. 18
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo circular limpio según diseño
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: const DecorationImage(
                    image: NetworkImage("https://raw.githubusercontent.com/Adrian-Hazael-hdz/UI_Exa1_1777/refs/heads/main/logo.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text("Adrian Hernandez 6I", 
                  style: TextStyle(fontSize: 14, color: Colors.black54)),
              const SizedBox(height: 50),
              // Inputs minimalistas (solo línea inferior como el boceto)
              const TextField(
                decoration: InputDecoration(
                  hintText: "USERNAME",
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "PASSWORD",
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {}, 
                  child: const Text("FORGOT PASSWORD", style: TextStyle(color: Colors.black38, fontSize: 11))
                ),
              ),
              const SizedBox(height: 30),
              // Botón redondeado de "SIGN IN"
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD1C4E9),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
                onPressed: () => Navigator.pushNamed(context, '/productos'),
                child: const Text("SIGN IN", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}