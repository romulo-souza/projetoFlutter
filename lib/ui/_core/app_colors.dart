//arquivo para modularização das cores do app, facilita caso altere no futuro

import 'package:flutter/material.dart';

//será uma classe abstrata pois não será instanciado nenhum objeto dela, apenas será usada para definir a cor (classe utilitária)
abstract class AppColors {
  //será estático, static permite acesso direto e global, sem precisar instanciar a classe (AppColors.mainColor, etc.)
  static const Color backgroundColor = Color(0xFF202123);
  static const Color mainColor = Color(0xFFFFa559);
  static const Color categoryWidgetColor = Color(0xFF343541);
}
