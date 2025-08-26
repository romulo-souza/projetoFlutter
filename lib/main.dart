import 'package:flutter/material.dart';
import 'package:projetoflutter/data/restaurants_data.dart';
import 'package:projetoflutter/ui/_core/app_theme.dart';
import 'package:projetoflutter/ui/_core/bag_provider.dart';
import 'package:projetoflutter/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  // a main é uma função assíncrona, pois usa a função assíncrona getRestaurants(), portanto precisamos garantir que o Flutter esteja inicializado antes de chamar runApp (executa todos codigos assíncronos antes de continuar)
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurants();

  //Função principal que inicializa o app, utilizando o provider para permitir que todas as telas acessem a instância de RestaurantData que já foi preenchida com os dados dos restaurantes.
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => restaurantData),
        ChangeNotifierProvider(create: (context) => BagProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  }); //construtor de MyApp está recebendo um parâmetro key e passando ele direto para o construtor da classe pai (StatelessWidget).

  @override //build será a construção da tela
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreen(), //primeira tela a ser mostrada ao inicializar o app
    );
  }
}
