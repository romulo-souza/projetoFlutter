//componente referente aos cards de categoria
//no caso o valor da categoria será passado quando chamarmos esse widget

import 'package:flutter/material.dart';
import 'package:projetoflutter/ui/_core/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  //final -> variavel que só pode ser inicializada uma vez, é imutavel
  final String category;

  const CategoryWidget({
    super.key,
    //recebe o valor do atributo category através do método construtor (valor obrigatório)
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.categoryWidgetColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        // para a coluna nao ocupar o maior tamanho possível e ficar contida dentro do container, ocupando somente os 100 de altura definido
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Image.asset(
            "assets/categories/${category.toLowerCase()}.png",
            height: 48,
          ),
          Text(
            category,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
