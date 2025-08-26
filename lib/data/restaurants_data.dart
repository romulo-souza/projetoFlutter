import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projetoflutter/model/restaurant.dart';

//Essa classe será responsável por obter os dados dos restaurantes a partir do arquivo JSON na pasta assets
//Terá gerenciamento de estado (com Provider), para notificar os ouvintes quando uma mudança ocorrer 

class RestaurantData extends ChangeNotifier {
  List<Restaurant> restaurantsList = [];

  // Método para popular a lista de restaurantes
  // Será chamado no início do app, para carregar os dados dos restaurantes
  Future<void> getRestaurants() async {

    // obter texto do json na pasta assets
    // rootBundle.loadString retorna um Future<String>, pois vai carregar os dados do armazenamento do dispositivo (operação assíncrona), por isso usamos async/await
    String jsonString = await rootBundle.loadString('assets/data.json');

    // decodificar o jsonString para um Map<String, dynamic>
    Map<String, dynamic> data = json.decode(jsonString);
    // acessar a lista de restaurantes dentro do Map, utiliza o List<dynamic> quando espera uma lista (array) de JSONs.
    List<dynamic> restaurantsData = data['restaurants']; // 'restaurants' é a chave do JSON/Map que contém a lista de restaurantes

    for (var restaurantData in restaurantsData) {
      // converter cada item do JSON/Map em um objeto Restaurant usando o construtor fromMap
      Restaurant restaurant = Restaurant.fromMap(restaurantData);
      // adicionar o objeto Restaurant à lista
      restaurantsList.add(restaurant);
    }
  }
}
