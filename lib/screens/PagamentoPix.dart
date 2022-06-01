import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';
import 'package:davidzonecidadao/screens/CodigoPix.dart';

class PagamentoPix extends StatelessWidget {
  const PagamentoPix({Key? key, required this.valor, required this.tempo, this.cidadaoInfo}) : super(key: key);
  final double valor;
  final int tempo;
  final cidadaoInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(),
      ),
      body: Stack(
        children: [
          const MarbleBackground(),
          Column(
            children: [
              upperContainer(
                uppertext: 'Comprar Ticket',
                image: SvgPicture.asset('assets/pix.svg'),
                imageheight: 93,
                bottomtext: 'Pagamento Pix',
              ),
              Padding(
                padding: const EdgeInsets.only( top: 30, bottom: 30 ),
                child: Container(
                  alignment: Alignment.center,
                  width: 115,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0,4),
                        )
                      ]
                    ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          'Valor',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'RobotoRegular',
                            color: Color(0xFF676767),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'R\$${valor}0',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'RobotoRegular',
                              color: Color(0xFF323232),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton(text: 'Gerar Código Pix', screen: CodigoPix(
                valor: valor,
                tempo: tempo,
                cidadaoInfo: cidadaoInfo,), validation: 1)
            ],
          ),
        ],
      )
    );
  }
}