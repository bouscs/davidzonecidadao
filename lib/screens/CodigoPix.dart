import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';
import 'package:davidzonecidadao/screens/PagamentoRealizado.dart';

class CodigoPix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(),
      ),
        body: Stack(
          children: [
            MarbleBackground(),
            Column(
              children: [
                upperContainer(
                  uppertext: 'Comprar Ticket',
                  image: SvgPicture.asset('assets/qrcode.svg'),
                  imageheight: 200,
                  bottomtext: 'Pagamento Pix',
                ),
                Padding(
                  padding: const EdgeInsets.only( top: 30 ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 290,
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
                        children: const [
                          Text(
                            'shhdp7ATDGDYihgyasgd6GY\nDAS5189AS645x94da54956',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'RobotoRegular',
                              color: Color(0xFF323232),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomButton(text: 'Copiar Código', screen: PagamentoRealizado(), validation: 1)
              ],
            ),
          ],
        )
    );
  }
}