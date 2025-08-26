//arquivo para configuração do tema do app (no caso dos botoes, eles possuem um estado, pressionado, nao pressionado e desabilitado)

import 'package:flutter/material.dart';
import 'package:projetoflutter/ui/_core/app_colors.dart';

abstract class AppTheme {
  //cópia do tema escuro padrão do flutter, para nao precisar configurar tudo do zero, porém com algumas modificaçoes dentro de copyWith
  static ThemeData appTheme = ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(
          Colors.black,
        ), //cor do texto, em todos os estados será a mesma
        backgroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey; //botão desabilitado
          } 
          else if (states.contains(WidgetState.pressed)) {
            return const Color.fromARGB(171, 255, 164, 89); //AppColors.mainColor, porém com maior transparencia, gera uma cor
          }
          else{
            return AppColors.mainColor; //cor padrão quando não pressionado
          }
        }),
      ),
    ), //todos elevatedButton do app seguirão essa config
  );
}
