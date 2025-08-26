import 'package:flutter/material.dart';
import 'package:projetoflutter/ui/_core/app_colors.dart';
import 'package:projetoflutter/ui/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Scaffold fornece a estrutura básica visual de uma tela (esqueleto da tela)
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      //Stack para deixar em "camadas", um na frente do outro, para fixar o banner em cima e nao ser centralizado junto com o conteudo da column
      body: Stack(
        children: [
          Image.asset('assets/banners/banner_splash.png'),
          //Centraliza na tela o seu elemento filho
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                //Alinhamento vertical dos filhos de Column
                mainAxisAlignment: MainAxisAlignment.center,
                //Espaçamento entre os elementos filhos de Column
                spacing: 40,
                children: [
                  Image.asset('assets/logo.png', width: 192),
                  Column(
                    children: [
                      Text(
                        'Um parceiro inovador para sua',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(
                        'melhor experiência culinária!',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity, //ocupa toda a largura da tela
                    child: ElevatedButton(
                      onPressed: () {
                        //MaterialPageRoute faz o roteamento usando o MaterialApp
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      },
                      child: Text('Bora!'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
