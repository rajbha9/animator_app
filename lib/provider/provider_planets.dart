import 'dart:convert';
import 'package:animator_app/modules/model_planet.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class PlanetProvider extends ChangeNotifier {
  late List<PlanetModel> _planets;

  PlanetProvider() {
    _planets = [];
    _fetchPlanets(); // Fetch planets when the provider is initialized
  }

  // Getter for accessing the list of planets
  List<PlanetModel> get planets => _planets;

  Future<void> _fetchPlanets() async {
    try {
      // Load JSON data from assets
      String jsonString =
      await rootBundle.loadString('asset/planets_datails.json');
      // Decode JSON string to a List<dynamic>
      List<dynamic> jsonList = json.decode(jsonString);
      // Convert each JSON object into a Planet object and add to the list
      _planets = jsonList.map((json) => PlanetModel.fromJson(json)).toList();
      // Notify listeners that the data has been fetched
      notifyListeners();
    } catch (e) {
      // Error handling if fetching fails
      print('Error fetching planets: $e');
    }
  }
}
