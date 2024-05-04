import 'package:animator_app/componets/planets_datails.dart';
import 'package:animator_app/provider/provider_planets.dart';
import 'package:animator_app/views/dateilpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    PlanetProvider planetProvider = Provider.of<PlanetProvider>(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'asset/img/bg.jpeg',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Planets',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: planetProvider.planets.length,
          itemBuilder: (BuildContext context, int index) {
            final planet = planetProvider.planets[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanetDetailScreen(planet: planet),
                  ),
                );
              },
              child: Container(
                height: 210,
                child: PlanetCard(
                  planets: [planet],
                  currentIndex: index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
