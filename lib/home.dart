import 'package:flutter/material.dart';
import 'import.dart';
import 'inicio.dart';
import 'salvar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  HomeState createState() => HomeState(); //instancia del estado
}

class HomeState extends State<Home> {
  int _selectDrawer = 0;
  _getDrawer(int pos) {
    switch (pos) {
      case 0:
        return const Inicio();
      case 1:
        return const Import();
      case 3:
        return const Salvar();
      case 4:
        return const Salvar();
      default:
    }
  }

  _onSelect(int pos) {
    Navigator.of(context).pop();
    setState(() {
      _selectDrawer = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //estructura
      drawer: Drawer(
        backgroundColor: const Color(0xFF1E1A20),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            //encabezado
            UserAccountsDrawerHeader(
              accountName: const Text("Cristiano Ronaldo"),
              accountEmail: const Text("cr7@gmail.com"),
              decoration: const BoxDecoration(color: Color(0xFF1E1A20)),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://media.zenfs.com/es/eluniversal.com.mx/5f172a54ff0d9d70afc8b4a5f7c34c88'),
                ),
              ),
            ),
            //colocar opcionesss
            GestureDetector(
              onTap: () {
                _onSelect(0);
              },
              child: ListTile(
                // tileColor: Color(0xFF36323C),
                leading: const Icon(
                  Icons.ac_unit_outlined,
                ),
                selected: (0 == _selectDrawer),
                selectedColor: const Color(0xFF6F5ADC),
                title: const Text(
                  "inicio",
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                _onSelect(1);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: ListTile(
                  // tileColor: Color(0xFF36323C),
                  leading: const Icon(
                    Icons.camera,
                  ),
                  title: const Text(
                    "importar",
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                  selected: (1 == _selectDrawer),
                  selectedColor: const Color(0xFF6F5ADC),
                ),
              ),
            ),

            //expansionTile
            Container(
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: const Color(0xFF36323C)),
              // width: 50,
              // color: const Color(0xFF36323C),
              margin: const EdgeInsets.only(top: 5),
              child: const ExpansionTile(
                title: Text("Categorias",
                    style: TextStyle(color: Color(0xFFFFFFFF))),
                leading: Icon(
                  Icons.person,
                ),
                childrenPadding: EdgeInsets.only(
                  left: 60,
                ),
                children: [
                  ListTile(
                    title: Text("categoria 1",
                        style: TextStyle(color: Color(0xFFFFFFFF))),
                  ),
                  ListTile(
                    title: Text("categoria 2",
                        style: TextStyle(color: Color(0xFFFFFFFF))),
                  ),
                  ListTile(
                    title: Text("categoria 3",
                        style: TextStyle(color: Color(0xFFFFFFFF))),
                  ),
                ],
              ),
            ),
            
            
            const Divider(),//hacer division 
            ListTile(
              // tileColor: Color(0xFF36323C),
              leading: const Icon(
                Icons.save,
              ),
              title: const Text(
                "Salvar",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              onTap: () {
                _onSelect(3);
              },
              selected: (3 == _selectDrawer),
              selectedColor: const Color(0xFF6F5ADC),
            ),
            //posisionar abajo
            ListTile(
              // tileColor: Color(0xFF36323C),
              leading: const Icon(
                Icons.exit_to_app,
              ),
              selected: (4 == _selectDrawer),
              selectedColor: const Color(0xFF6F5ADC),
              title: const Text(
                "Salir",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              onTap: () {
                _onSelect(4);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
          title: const Text("AppBar"),
          backgroundColor: Colors.blue.shade700), //apbar
      body: _getDrawer(_selectDrawer),
    );
  }
}
