import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'catalog.dart';
import 'home_page.dart';
import 'favourites_page.dart';
import 'chat_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Catalog>(
      create: (context) => Catalog(),
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}

Widget menu(){
  return Container(
      color: Colors.green,
      child: const TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.lime,
        tabs: [
          Tab(
            text: "Главная",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "Избранное",
            icon: Icon(Icons.favorite),
          ),
          Tab(
            text: "Чаты",
            icon: Icon(Icons.chat),
          ),
        ],
      )
  );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              ChangeNotifierProvider<Catalog>(
                create: (context) => Catalog(),
                child: const MaterialApp(
                    home: HomePage()
                ),
              ),
              const FavouritesPage(),
              const ChatPage()
            ],
          ),
        ),
      ),
    );
  }
}
