import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _affichage = '';
  
  


  void _itemClique(int index) {
    setState(() {
      _selectedIndex = index;
      switch(_selectedIndex){
        case  0:
        {
          _affichage = '$_selectedIndex : Accueil';
        }
        break;
        case  1:
        {
          _affichage = '$_selectedIndex : Mon Compte';
        }
        break;
        case  2:
        {
          _affichage = '$_selectedIndex : Menu';
        }
        break;
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Accueil",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 47, 3, 70),
        iconTheme: const IconThemeData(
        color: Colors.white,
      ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 242, 243, 243),
                  borderRadius: BorderRadius.circular(4),
                ),
                
                child: const Text('Menu de Navigation'),
              ),
              ListTile(
                title: const Text('Menu'),
                selected: _selectedIndex == 2,
                onTap: () {
                  
                  _itemClique(2);
                },
                
              ),
              ListTile(
                title: const Text('Accueil'),
                textColor: Colors.black,
                selected: _selectedIndex == 0,
                onTap: () {
                  _itemClique(0);
                
                },
                
              ),
              ListTile(
                title: const Text('Mon Compte'),
                selected: _selectedIndex == 1,
                
                onTap: () {
                  _itemClique(1);
                },
                
              ),
              
            ],
            
          ),
        ),

        body : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : <Widget>[
              Image.network('https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExbzFsMGlneXFqeWVkaTd0cWp5dWM5Yng5Mm9vNTk2N3owcmN1ZjIwNiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Tj4jjaCxXRVSARsUzN/giphy.webp',width: 500,),
              Text(_affichage),
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton.large(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MySecondePage(title : widget.title) ));
        },
        child: Icon(Icons.arrow_forward_ios),
        ),
        

        floatingActionButtonLocation : FloatingActionButtonLocation.miniCenterFloat,
        bottomNavigationBar:  BottomNavigationBar(
          items : const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon : Icon(Icons.home,color: Colors.white,),
              label:'Accueil',
            ),
            BottomNavigationBarItem(
              icon : Icon(Icons.account_circle,color: Colors.white,),
              label:'Mon Compte',
            ),
            BottomNavigationBarItem(
              icon : Icon(Icons.menu,color: Colors.white,),
              label:'Menu',
            ),
            
          ],
          onTap: _itemClique,
          currentIndex : _selectedIndex,
          backgroundColor: const Color.fromARGB(255, 47, 3, 70),
        ),
        backgroundColor: Colors.black,
        
        
        
            
        
    );
  }
}

class MySecondePage extends StatefulWidget {
  const MySecondePage({super.key, required this.title});
  final String title;

  @override
  State<MySecondePage> createState() => _MySecondePageState();
}

class _MySecondePageState extends State<MySecondePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 500,
                  child: Container(
                    margin: EdgeInsets.only(top: 200),
                    // Titre
                    child: Text(
                      "Qu'est-ce qu'un Trou Noir ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40, color: Colors.purple),
                    ),
                  ),
                ),
                // Description
                SizedBox(
                  width: 550,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    margin: EdgeInsets.only(top: 24),
                    child: Text(
                      "Un trou noir est une région de l'espace dont le champ gravitationnel est si intense qu'il empêche toute forme de matière ou de rayonnement de s'en échapper. Un trou noir est créé après la mort d'une étoile très massive.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 20, color: Colors.purple),
                    ),
                  ),
                ),
                // Étoiles + Avis
                SizedBox(
                  width: 500,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    margin: EdgeInsets.only(top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.purple),
                                Icon(Icons.star, color: Colors.purple),
                                Icon(Icons.star, color: Colors.purple),
                                Icon(Icons.star, color: Colors.purple),
                                Icon(Icons.star, color: Colors.purple),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '56564 avis',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: Colors.purple),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // Icônes + Texte en dessous
                SizedBox(
                  width: 500,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    margin: EdgeInsets.only(top: 24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.public, color: Colors.purple), // Univers
                            Icon(Icons.brightness_3, color: Colors.purple), // Étoile morte
                            Icon(Icons.radio_button_on, color: Colors.purple), // Singularité
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Univers", style: TextStyle(color: Colors.purple)),
                            Text("Étoile morte", style: TextStyle(color: Colors.purple)),
                            Text("Singularité", style: TextStyle(color: Colors.purple)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Espace infini", style: TextStyle(color: Colors.purple)),
                            Text("Effondrement", style: TextStyle(color: Colors.purple)),
                            Text("Horizon des évènements", style: TextStyle(color: Colors.purple)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'Assets/Image/nasa_noir.jpg',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      backgroundColor: Colors.black,
    );
  }
}


