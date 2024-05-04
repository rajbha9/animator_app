import 'package:animator_app/modules/model_planet.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class PlanetCard extends StatelessWidget {
  final List<PlanetModel> planets;
  final int currentIndex;

  const PlanetCard(
      {Key? key, required this.planets, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: planets.length,
      controller: PageController(
        initialPage: currentIndex,
        // viewportFraction: 0.9,
      ),
      itemBuilder: (context, index) {
        final planet = planets[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: GlassmorphicContainer(
            height: 200,
            width: double.infinity,
            blur: 1,
            borderRadius: 40,
            border: 0.7,
            linearGradient: LinearGradient(
              colors: [
                const Color(0xFF000000).withOpacity(0.1),
                const Color(0xFFFFFFFF).withOpacity(0.5),
              ],
              stops: const [
                0.1,
                1,
              ],
            ),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.5),
                const Color((0xFFFFFFFF)).withOpacity(0.5),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Hero(
                      tag: planet.name,
                      child: Image.network(
                        planet.image,
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Text(
                      planet.name,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Position: ${planet.position}",
                      style: const TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Velocity: ${planet.velocity} km/s",
                      style: const TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Distance: ${planet.distance}",
                      style: const TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.double_arrow_outlined)
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
