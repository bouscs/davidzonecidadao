import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';

class ComprarTicket extends StatelessWidget {
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
        upperContainer(
          uppertext: 'Comprar Ticket',
          image: SvgPicture.asset('assets/ticket_art.svg'),
          bottomtext: 'Informe os dados para\npagamento',
          ),
        //bottomContainer(),
    ],
    )
    );
  }
}