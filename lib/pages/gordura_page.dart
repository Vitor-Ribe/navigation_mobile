import 'dart:math';
import 'package:flutter/material.dart';

class GorduraPage extends StatefulWidget {
  const GorduraPage({super.key});

  @override
  State<GorduraPage> createState() => _GorduraPageState();
}

class _GorduraPageState extends State<GorduraPage> {
  final alturaController = TextEditingController();
  final pescocoController = TextEditingController();
  final cinturaController = TextEditingController();
  final quadrilController = TextEditingController();

  String sexo = 'Homem';
  String resultado = '';

  void calcularGorduraCorporal() {
    final altura = double.tryParse(alturaController.text);
    final pescoco = double.tryParse(pescocoController.text);
    final cintura = double.tryParse(cinturaController.text);
    final quadril = double.tryParse(quadrilController.text);

    if (altura == null || pescoco == null || cintura == null || (sexo == 'Mulher' && quadril == null)) {
      setState(() {
        resultado = 'Preencha todos os campos corretamente.';
      });
      return;
    }

    double percentual;

    if (sexo == 'Homem') {
      percentual = 86.010 * log(cintura - pescoco) / ln10
          - 70.041 * log(altura) / ln10
          + 36.76;
    } else {
      percentual = 163.205 * log(cintura + quadril! - pescoco) / ln10
          - 97.684 * log(altura) / ln10
          - 78.387;
    }

    setState(() {
      resultado = '${percentual.toStringAsFixed(2)}% de gordura corporal';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Sexo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'Homem',
                  fillColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.blue; // quando selecionado
                    }
                    return Colors.grey; // quando não selecionado
                  }),
                  groupValue: sexo,
                  onChanged: (value) {
                    setState(() {
                      sexo = value!;
                    });
                  },
                ),
                Text('Homem'),
                SizedBox(width: 20),
                Radio(
                  value: 'Mulher',
                  groupValue: sexo,
                  fillColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.blue; // quando selecionado
                    }
                    return Colors.grey; // quando não selecionado
                  }),
                  onChanged: (value) {
                    setState(() {
                      sexo = value!;
                    });
                  },
                ),
                Text('Mulher'),
              ],
            ),
            SizedBox(height: 20),

            campoTexto('sua altura (cm)', alturaController, Icons.accessibility),
            campoTexto('seu pescoço (cm)', pescocoController, Icons.straighten),
            campoTexto('sua cintura (cm)', cinturaController, Icons.straighten),
            if (sexo == 'Mulher') campoTexto('seu quadril (cm)', quadrilController, Icons.straighten),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: calcularGorduraCorporal,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text('Calcular', style: TextStyle(fontSize: 20, color: Colors.white)),
            ),

            SizedBox(height: 30),
            Text(
              resultado,
              style: TextStyle(fontSize: 24, color: Colors.blueGrey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget campoTexto(String label, TextEditingController controller, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Digite aqui $label',
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
          prefixIcon: Icon(icon, color: Colors.blueGrey),
        )
      ),
    );
  }
}
