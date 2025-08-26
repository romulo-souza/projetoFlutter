//Classe Restaurant

import 'package:projetoflutter/model/dish.dart';

class Restaurant {
  String id;
  String imagePath;
  String name;
  String description;
  double stars;
  int distance;
  List<String> categories;
  List<Dish> dishes;

  //Construtor da classe Restaurant
  Restaurant({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.stars,
    required this.distance,
    required this.categories,
    required this.dishes,
  });

  //Construtor Especial para pegar os dados de um map e converter em um objeto Restaurant
  //factory usa-se quando criamos um construtor que usa outro construtor (o construtor padrão, no caso)
  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'], //pega o valor do map cuja chave é 'id' é atribui ao atributo id do objeto Restaurant
      imagePath: map['imagePath'],
      name: map['name'],
      description: map['description'],
      stars: map['stars'],
      distance: map['distance'],
      categories: List<String>.from(map['categories']),
      // função .map -> percorre a lista de map, e para cada map de dish, converte em um objeto Dish
      dishes: List<Dish>.from(
        map['dishes'].map((dishMap) => Dish.fromMap(dishMap)),
      ),
    );
  }

  //método para converter o objeto Restaurant em um Map (estrutura de dados chave-valor)
  //serve para pegar os dados de um objeto Restaurant e adicionar no json ou banco de dados, por exemplo
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'description': description,
      'stars': stars,
      'distance': distance,
      'categories': categories,
      // função map -> percorre a lista dishes e para cada objeto dish, chama o seu método toMap e cria uma lista com os resultados
      'dishes': dishes.map((dish) => dish.toMap()).toList(),
    };
  }

  //método para facilitar a visualização dos dados do objeto Restaurant no console (teste)
  //toString é um método padrão do Dart que retorna uma representação em string do objeto, precisamos sobrescrevê-lo para personalizar a saída
  @override
  String toString() {
    return 'Restaurant{id: $id, imagePath: $imagePath, name: $name, description: $description, stars: $stars, distance: $distance, categories: $categories}';
  }
}
