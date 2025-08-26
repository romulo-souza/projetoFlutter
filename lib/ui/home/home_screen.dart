import 'package:flutter/material.dart';
import 'package:projetoflutter/data/categories_data.dart';
import 'package:projetoflutter/data/restaurants_data.dart';
import 'package:projetoflutter/ui/_core/widgets/appbar.dart';
import 'package:projetoflutter/ui/home/widgets/category_widget.dart';
import 'package:projetoflutter/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // acessar a instância de RestaurantData fornecida pelo Provider
    // permite acesso a todos os dados e métodos dessa instância
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: getCustomAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32,
            //alinhamento no sentido horizontal
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              Text('Boas vindas!'),
              TextFormField(),
              Text('Escolha por categoria'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  //List.generate a partir do tamanho definido para lista (lista de categorias), renderiza o widget para cada elemento da lista
                  children: List.generate(CategoriesData.listCategories.length, (
                    index,
                  ) {
                    return CategoryWidget(
                      // para cada elemento da lista de categorias, será retornado um widget de categoria, com o valor da categoria passado pelo indice
                      category: CategoriesData.listCategories[index],
                    );
                  }),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text('Bem avaliados'),
              Column(
                spacing: 20,
                //renderizar os widgets de restaurante
                children: List.generate(restaurantData.restaurantsList.length, (
                  index,
                ) {
                  return RestaurantWidget(
                    restaurant: restaurantData.restaurantsList[index],
                  );
                }),
              ),
              SizedBox(height: 64), // espaçamento inferior
            ],
          ),
        ),
      ),
    );
  }
}
