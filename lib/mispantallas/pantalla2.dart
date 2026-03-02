import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  final List<Map<String, dynamic>> productos = [
    {
      "nombre": "PC Gamer Ultra",
      "precio": "\$25,000",
      "img": "https://raw.githubusercontent.com/Adrian-Hazael-hdz/UI_Exa1_1777/refs/heads/main/producto1.jpg",
      "labels": ["Gamer", "Pro"],
      "comentarios": 5
    },
    {
      "nombre": "Smartphone Z",
      "precio": "\$12,000",
      "img": "https://raw.githubusercontent.com/Adrian-Hazael-hdz/UI_Exa1_1777/refs/heads/main/producto3.jpg",
      "labels": ["Nuevo"],
      "comentarios": 0
    },
    {
      "nombre": "Teclado RGB",
      "precio": "\$1,500",
      "img": "https://raw.githubusercontent.com/Adrian-Hazael-hdz/UI_Exa1_1777/refs/heads/main/producto4.jpg",
      "labels": ["Mecánico", "RGB"],
      "comentarios": 12
    },
    {
      "nombre": "Monitor 4K",
      "precio": "\$8,500",
      "img": "https://raw.githubusercontent.com/Adrian-Hazael-hdz/UI_Exa1_1777/refs/heads/main/producto6.jpg",
      "labels": ["4K", "IPS"],
      "comentarios": 3
    },
    {
      "nombre": "Mouse Pro",
      "precio": "\$1,200",
      "img": "https://raw.githubusercontent.com/Adrian-Hazael-hdz/UI_Exa1_1777/refs/heads/main/producto2.jpg",
      "labels": ["Wireless"],
      "comentarios": 8
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EAF6),
      appBar: AppBar(
        title: const Text("explorar PChop"),
        backgroundColor: const Color(0xFFC5CAE9),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Filter",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final prod = productos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/detalle'),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen a la izquierda según diseño 18
                    Image.network(prod['img'], width: 80, height: 80, fit: BoxFit.cover),
                    const SizedBox(width: 15),
                    // Información detallada
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(prod['nombre'],
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(prod['precio'], style: const TextStyle(color: Colors.grey)),
                          const SizedBox(height: 8),
                          // Fila de Etiquetas (Labels)
                          Wrap(
                            spacing: 5,
                            children: (prod['labels'] as List<String>)
                                .map((label) => Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[700],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(label,
                                          style: const TextStyle(color: Colors.white, fontSize: 10)),
                                    ))
                                .toList(),
                          ),
                          const SizedBox(height: 8),
                          // Contador de comentarios según diseño 18
                          Row(
                            children: [
                              const Icon(Icons.chat_bubble_outline, size: 14, color: Colors.grey),
                              const SizedBox(width: 5),
                              Text("${prod['comentarios']} Comments",
                                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF5E35B1),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ""),
        ],
      ),
    );
  }
}