import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotiCheck',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8AC0CE)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var controllerTitle = TextEditingController();
  var controllerContent = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/home_home.png"),
              const SizedBox(height: 15, width: double.infinity),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF8AC0CE)),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset("assets/home_1.png"),
                      title: const Text("Comienza a analizar la subjetividad de artículos periodísticos", textAlign: TextAlign.justify),
                    ),
                    const SizedBox(height: 15, width: double.infinity),
                    ListTile(
                      trailing: Image.asset("assets/home_2.png"),
                      title: const Text("Intenta ingresar los datos de una noticia en los siguientes espacios", textAlign: TextAlign.justify),
                    ),
                    const SizedBox(height: 15, width: double.infinity),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text("Ingresa el titular de la noticia"),
                          TextFormField(
                            controller: controllerTitle,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder()
                            ),
                            validator: (value) {
                              if (value == null) return "Completa el campo por favor";
                              if (value.isEmpty) return "Completa el campo por favor";
                              if (value.length > 50) return "Solo se pueden analizar 50 caracteres";
                              return null;
                            },
                          ),
                          const SizedBox(height: 15, width: double.infinity),
                          const Text("Ingresa el contenido de la noticia"),
                          SizedBox(
                            height: 120, // <-- TextField height
                            child: TextFormField(
                              maxLines: null,
                              expands: true,
                              keyboardType: TextInputType.multiline,
                              controller: controllerContent,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()
                              ),
                              validator: (value) {
                                if (value == null) return "Completa el campo por favor";
                                if (value.isEmpty) return "Completa el campo por favor";
                                if (value.length > 250) return "Solo se pueden analizar 250 caracteres";
                                return null;
                              },
                            ),
                          ),
                        ],
                      )
                    ),
                    const SizedBox(height: 15, width: double.infinity),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF8AC0CE),
                              side: const BorderSide(color: Color(0xFF8AC0CE))
                            ),
                            onPressed: () {
                              controllerContent.clear();
                              controllerTitle.clear();
                            },
                            child: const Text("Limpiar")
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xFF8AC0CE),
                            ),
                            onPressed: () {
                              if(formKey.currentState!.validate()) {

                              }
                            },
                            child: const Text("Analizar Texto")
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15, width: double.infinity),
                    ListTile(
                      leading: Image.asset("assets/home_3.png"),
                      title: const Text("Los resultados del análisis se mostrarán en la parte inferior", textAlign: TextAlign.justify),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
