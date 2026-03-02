import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Pantalla3 extends StatefulWidget {
  @override
  State<Pantalla3> createState() => _Pantalla3State();
}

class _Pantalla3State extends State<Pantalla3> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> imagenes = [
    "https://raw.githubusercontent.com/Adrian-Hazael-hdz/UI_Exa1_1777/refs/heads/main/producto1.jpg",
    "https://raw.githubusercontent.com/Adrian-Hazael-hdz/UI_Exa1_1777/refs/heads/main/imagen2.jpg",
    "https://raw.githubusercontent.com/Adrian-Hazael-hdz/UI_Exa1_1777/refs/heads/main/imagen3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco para apegarse al boceto
      // AppBar ELIMINADA por corrección del usuario
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // La imagen inicia desde el tope de la pantalla
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4, // 40% de la pantalla
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() => _currentPage = page);
                      },
                      itemCount: imagenes.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          imagenes[index],
                          fit: BoxFit.cover, // Cubre el espacio superior como el boceto
                        );
                      },
                    ),
                  ),
                  // Botón de retroceso manual (ya que no hay AppBar)
                  Positioned(
                    top: 40,
                    left: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  // Indicadores de círculos (Dots)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        imagenes.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index ? Colors.black : Colors.black26,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "PC Gamer Ultra",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text("Adrian Hernandez 6I", style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 20),
                    
                    // Botones Like y Comment como el boceto
                    Row(
                      children: [
                        _actionButton(Icons.thumb_up_alt_outlined, "Like"),
                        const SizedBox(width: 15),
                        _actionButton(Icons.chat_bubble_outline, "Comment"),
                      ],
                    ),
                    
                    const SizedBox(height: 25),
                    const Text(
                      "Esta estación de batalla de alto rendimiento fusiona una estética agresiva en rojo carmesí con un flujo de aire de presión positiva y componentes de última generación para garantizar un dominio absoluto en gaming 4K y multitarea intensiva bajo cualquier carga de trabajo. Nunca más tendras que preocuparte por bajones de fps, rendimiento cuestionable, gasto innecesario de ram entre otros problemas.",
                      style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.6),
                    ),
                    const SizedBox(height: 40),
                    
                    // Botón inferior negro
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("VOLVER AL CATÁLOGO", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para los botones de Like/Comment
  Widget _actionButton(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black54),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}