import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';
import 'package:davidzonecidadao/screens/PagamentoRealizado.dart';

class CodigoPix extends StatelessWidget {
  String codigo = 'shhdp7ATDGDYihgyasgd6GY\nDAS5189AS645x94da54956';

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
                        children: [
                          Text(
                            codigo,
                            style: const TextStyle(
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 217,
                    height: 47,
                    decoration: BoxDecoration(
                      color: Color(0xFF505050),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: FlatButton(
                      onPressed: () {
                        const snackBar = SnackBar(
                          content: Text('Código copiado com sucesso!'),
                        );
                        Clipboard.setData(ClipboardData(text: codigo))
                        .then((value) {// only if ->
                          ScaffoldMessenger.of(context).showSnackBar(snackBar); });
                      },
                      child: const Text(
                        'Copiar Código',
                        style: TextStyle(
                          fontFamily: 'RobotoBold',
                          fontSize: 16,
                          color: Color(0xFFFFFFFF),
                        ),),
                    ),
                  ),
                ),
                const CustomButton(text: 'SIMULAR PAGAMENTO', screen: PagamentoRealizado(), validation: 1),
              ],
            ),
          ],
        )
    );
  }
}