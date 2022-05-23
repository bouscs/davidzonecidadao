import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';

class SelecionarMetodoPagamento extends StatefulWidget {
  @override
  State<SelecionarMetodoPagamento> createState() => _SelecionarMetodoPagamentoState();
}

class _SelecionarMetodoPagamentoState extends State<SelecionarMetodoPagamento> {
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
                  image: SvgPicture.asset('assets/ticket_art.svg'),
                  bottomtext: 'Selecione o tempo de estadia\ndesejado',
                ),
                bottomContainerComprarTicket(),
              ],
            ),
          ],
        )
    );
  }
}

class bottomContainerComprarTicket extends StatefulWidget {

  @override
  State<bottomContainerComprarTicket> createState() => _bottomContainerComprarTicketState();
}

class _bottomContainerComprarTicketState extends State<bottomContainerComprarTicket> {
  int selectedRadio = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<int>(
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (value) => setState(() => selectedRadio = 1)),
                  CustomTextBox(text: "Cartão")
                ],),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<int>(
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (value) => setState(() => selectedRadio = 2)),
                  CustomTextBox(text: "Pix")
                ],),
            ),

            CustomButton(text: "Próximo", screen: MyHomePage())
          ],
        ),
      ),
    );
  }
}

class CustomTextBox extends StatelessWidget {
  final String text;

  CustomTextBox({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
        alignment: Alignment.center,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0,4),
              )]
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "RobotoRegular",
              fontSize: 14,
            ),
          ),
        )
    );
  }
}


