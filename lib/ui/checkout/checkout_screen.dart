import 'package:flutter/material.dart';
import 'package:projetoflutter/model/dish.dart';
import 'package:projetoflutter/ui/_core/app_colors.dart';
import 'package:projetoflutter/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    double deliveryFee = 5.00;

    if (bagProvider.dishesOnBag.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Sacola')),
        body: Center(child: Text('Sua sacola está vazia')),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sacola'),
          actions: [
            TextButton(
              onPressed: () => bagProvider.clearBag(),
              child: Text(
                'Limpar',
                style: TextStyle(color: AppColors.mainColor),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              // stretch faz com que os filhos ocupem toda a largura disponivel
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Pedidos",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Column(
                  // ao inves de mostrar todos os pratos, mostrar a quantidade de cada prato
                  children: List.generate(bagProvider.getDishCount().keys.length, (
                    index,
                  ) {
                    Dish dish = bagProvider.getDishCount().keys.toList()[index];

                    return ListTile(
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => bagProvider.removeDish(dish),
                            icon: Icon(
                              Icons.remove,
                              color: AppColors.mainColor,
                            ),
                          ),
                          // pega o valor que está no map getDishCount através da chave dish
                          Text(
                            bagProvider.getDishCount()[dish].toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          IconButton(
                            onPressed: () => bagProvider.addAllDishes([dish]),
                            icon: Icon(Icons.add, color: AppColors.mainColor),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 12,
                  children: [
                    SizedBox(height: 2),
                    Text(
                      "Pagamento",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 58,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(202, 55, 54, 54),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        spacing: 12,
                        children: [
                          Image.asset(
                            'assets/others/visa.png',
                            width: 30,
                            height: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('VISA Classic'), Text('****-0976')],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Endereço de entrega',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 58,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(202, 55, 54, 54),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        spacing: 12,
                        children: [
                          Icon(Icons.location_on, color: Colors.white),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Rua das Acácias, 28'),
                              Text('Casa 10'),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Confirmação do pedido',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 78,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(202, 55, 54, 54),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        spacing: 12,
                        children: [
                          Column(
                            spacing: 7,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Valor do pedido:'),
                              Text('Taxa de entrega:'),
                              Text('Total:'),
                            ],
                          ),
                          Spacer(),
                          Column(
                            spacing: 7,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'R\$ ${bagProvider.getTotalPrice().toStringAsFixed(2)}',
                              ),
                              Text('R\$ ${deliveryFee.toStringAsFixed(2)}'),
                              Text(
                                'R\$ ${(bagProvider.getTotalPrice() + deliveryFee).toStringAsFixed(2)}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // // Botão de checkout sempre visível no rodapé mesmo com scroll
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
            color: Colors.transparent,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Finalizar pedido (R\$ ${(bagProvider.getTotalPrice() + deliveryFee).toStringAsFixed(2)})',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );
    }
  }
}
