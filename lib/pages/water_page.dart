import 'package:flutter/material.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({super.key});

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  final pesoController = TextEditingController();
  String resultado = '';

  void calcularAguaDiaria() {
    final peso = double.tryParse(pesoController.text);
    if (peso != null && peso > 0) {
      final agua = peso * 35; // ml por dia
      setState(() {
        resultado = '${agua.toStringAsFixed(0)} ml';
      });
    } else {
      setState(() {
        resultado = 'Peso inválido';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade700, Colors.lightBlueAccent.shade100],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    resultado.isEmpty ? 'ml' : resultado,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: resultado.isEmpty ? 70 : 30,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Peso',
                style: TextStyle(color: Colors.blueGrey, fontSize: 20),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Digite seu peso aqui (Kg)',
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                ),
                prefixIcon: Icon(Icons.monitor_weight_outlined, color: Colors.blueGrey),
              ),
            ),

            SizedBox(height: 80),

            Center(
              child: ElevatedButton(
                onPressed: calcularAguaDiaria,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text('Calcular', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
