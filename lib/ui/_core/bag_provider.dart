import 'package:flutter/material.dart';
import 'package:projetoflutter/model/dish.dart';

// gerenciar o estado do carrinho de compras
class BagProvider extends ChangeNotifier {
  List<Dish> dishesOnBag = [];

  //Adicionar todos os pratos de uma lista na sacola
  void addAllDishes(List<Dish> dishes) {
    dishesOnBag.addAll(dishes);
    notifyListeners(); //notifica os ouvintes que houve uma mudança
  }

  //Remover um prato da sacola
  void removeDish(Dish dish) {
    dishesOnBag.remove(dish);
    notifyListeners();
  }

  //Limpar a sacola
  void clearBag() {
    dishesOnBag.clear();
    notifyListeners();
  }

  // Map que retorna a quantidade de cada prato na sacola
  Map<Dish, int> getDishCount() {
    Map<Dish, int> dishCount = {};
    for (Dish dish in dishesOnBag) {
      //se o prato ainda não está no map, adiciona com quantidade 1 (valor da chave recebe 1)
      if (dishCount[dish] == null) {
        dishCount[dish] = 1;
      }
      //se o prato já está no map, incrementa a quantidade
      else {
        //O ! serve para garantir ao compilador que a variável não é nula
        dishCount[dish] = dishCount[dish]! + 1;
      }
    }
    return dishCount;
  }

  //método que retorna o valor total dos pratos na sacola
  double getTotalPrice() {
    double total = 0.0;
    for (Dish dish in dishesOnBag) {
      total += dish.price;
    }
    return total;
  }
}
