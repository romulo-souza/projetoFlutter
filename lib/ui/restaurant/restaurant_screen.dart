import 'package:flutter/material.dart';
import 'package:projetoflutter/model/dish.dart';
import 'package:projetoflutter/model/restaurant.dart';
import 'package:projetoflutter/ui/_core/app_colors.dart';
import 'package:projetoflutter/ui/_core/bag_provider.dart';
import 'package:projetoflutter/ui/_core/widgets/appbar.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context: context, title: restaurant.name),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Center(
              child: Image.asset(
                'assets/${restaurant.imagePath}',
                width: 115,
                height: 100,
              ),
            ),
            Text(
              "Mais pedidos",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              children: List.generate(restaurant.dishes.length, (index) {
                Dish dish = restaurant.dishes[index];
                //ListTile é um widget pré-construído que representa um item em uma lista, já tem um layout padrão
                return ListTile(
                  //remove o padding padrão do ListTile
                  contentPadding: EdgeInsets.zero,
                  //ClipRRect para arredondar as bordas da imagem, leading é o widget que aparece na esquerda
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/dishes/default.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(dish.name),
                  subtitle: Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                  // trailing é o widget que aparece na direita
                  trailing: IconButton(
                    onPressed: () {
                      //adicionar o prato na sacola (altera o estado do BagProvider)
                      context.read<BagProvider>().addAllDishes([dish]);
                    },
                    icon: Icon(Icons.add_circle, color: AppColors.mainColor),
                  ),
                  //exibir uma caixa de dialogo mostrando detalhes do prato
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(child: Text(dish.name)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/dishes/default.png',
                                width: 200,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 10),
                              Text(
                                dish.description,
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: 10),
                              Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Center(child: Text('Fechar')),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
