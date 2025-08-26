import 'package:flutter/material.dart';
import 'package:projetoflutter/model/restaurant.dart';
import 'package:projetoflutter/ui/restaurant/restaurant_screen.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    // inkWell dá efeito visual de clique, como se fosse um botão
    // ao clicar, navega para a tela de restaurante, passando o restaurante selecionado
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantScreen(restaurant: restaurant),
          ),
        );
      },
      child: Row(
        spacing: 12,
        children: [
          Image.asset('assets/${restaurant.imagePath}', width: 72),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                //renderizar a quantidade de estrelas conforme o valor de restaurant.stars
                children: List.generate(restaurant.stars.toInt(), (index) {
                  return Icon(Icons.star, color: Colors.amber, size: 16);
                }),
              ),
              Text("${restaurant.distance}km"),
            ],
          ),
        ],
      ),
    );
  }
}
