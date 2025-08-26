// Modluarização do AppBar

//nao será um statalessWidget pois iremos usar a própria appBar do flutter, e apenas customizá-la

import 'package:flutter/material.dart';
import 'package:projetoflutter/ui/_core/bag_provider.dart';
import 'package:projetoflutter/ui/checkout/checkout_screen.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart'
    as badges; // importação do pacote de badges usado para o ícone da sacola com contador de notificações

AppBar getCustomAppBar({required BuildContext context, String? title}) {
  //acesso aos dados do BagProvider
  BagProvider bagPovider = Provider.of<BagProvider>(context);

  return AppBar(
    title: title != null ? Text(title) : null,
    centerTitle: true,
    actions: [
      badges.Badge(
        showBadge: bagPovider.dishesOnBag.isNotEmpty,
        position: badges.BadgePosition.bottomStart(start: 0, bottom: 0),
        badgeContent: Text(
          bagPovider.dishesOnBag.length.toString(),
          style: TextStyle(fontSize: 10),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutScreen()),
            );
          },
          icon: Icon(Icons.shopping_basket),
        ),
      ),
    ],
  );
}
