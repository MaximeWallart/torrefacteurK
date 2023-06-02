import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:torrefactor/API/Exploitation.dart';
import 'package:torrefactor/API/Joueur.dart';
import 'package:torrefactor/data/fetch.dart';
import 'package:torrefactor/firebase_options.dart';
import 'package:torrefactor/views/accueil.dart';
import 'package:torrefactor/views/exploitation_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF96520F),
            onPrimary: Colors.white,
            secondary: Color(0xFFF9E1D7),
            onSecondary: Color(0xFF272121),
            error: Colors.red,
            onError: Colors.white,
            background: Colors.white,
            onBackground: Colors.black,
            surface: Color(0xFFD8D8C1),
            onSurface: Colors.white),
      ),
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
  int index = 0;
  Joueur joueur = Joueur(
      id: "abcd",
      nom: "Wallart",
      prenom: "Waxime",
      avatar: "maximew",
      pseudo: "XxK@fÉ2F0uxX",
      bourse: 20,
      bourseGrainOr: 0,
      mail: "maximeW@gmail.com",
      exploitation: Exploitation(nom: "Exploitation de M.Wallart"));

  var screens = [];
  final _controller = PageController();
  late PageView pageView;

  @override
  void initState() {
    pageView = PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      onPageChanged: (value) {
        setState(() {
          index = value;
        });
      },
      children: [
        Accueil(
          joueur: joueur,
        ),
        ExploitationView(exploitation: joueur.exploitation)
      ],
    );
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    pageView = PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      onPageChanged: (value) {
        setState(() {
          index = value;
        });
      },
      children: [
        Accueil(
          joueur: joueur,
        ),
        ExploitationView(exploitation: joueur.exploitation)
      ],
    );
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Image.asset('assets/image-removebg-preview.png',
                fit: BoxFit.cover)),
      ),
      bottomNavigationBar: GNav(
          onTabChange: (value) {
            setState(() {
              index = value;
              _controller.animateToPage(value,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            });
          },
          selectedIndex: index,
          backgroundColor: Theme.of(context).colorScheme.primary,
          color: Theme.of(context).colorScheme.secondary,
          activeColor: Theme.of(context).colorScheme.onSecondary,
          tabBackgroundColor: Theme.of(context).colorScheme.secondary,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
          tabMargin: const EdgeInsets.all(10),
          mainAxisAlignment: MainAxisAlignment.center,
          gap: 8,
          tabs: const [
            GButton(icon: Icons.home, text: "Accueil"),
            GButton(
              icon: Icons.yard_outlined,
              text: "Exploitation",
            )
          ]),
      body: pageView,
      floatingActionButton: FloatingActionButton(
          onPressed: (() {
            updateJoueur(joueur);
          }),
          child: const Icon(Icons.refresh_rounded)),
    );
  }
}
