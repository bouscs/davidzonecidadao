import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';

class PagamentoRealizado extends StatelessWidget {
  const PagamentoRealizado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(),
      ),
      body: const Center(
        child: Text(
            'Pagamento Realizado'
        ),
      ),
    );
  }
}