import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';
import 'package:davidzonecidadao/screens/SelecionarTempo.dart';

class ComprarTicket extends StatelessWidget {
  const ComprarTicket({Key? key}) : super(key: key);

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
        SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              upperContainer(
                uppertext: 'Comprar Ticket',
                image: SvgPicture.asset('assets/ticket_art.svg'),
                imageheight: 137,
                bottomtext: 'Informe os dados para\npagamento',
                ),
              bottomContainerComprarTicket(),
            ],
          ),
        ),
    ],
    )
    );
  }
}

class bottomContainerComprarTicket extends StatelessWidget {
  const bottomContainerComprarTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Column(
          children: const [
            CustomTextfield(text: "Placa do Veículo", icon: Icon(
              Icons.directions_car_outlined,
              color: Color(0xFF3F3F3F),)
            ),
            CustomTextfield(text: "CPF/CNPJ", icon: Icon(
              Icons.person_outline,
              color: Color(0xFF3F3F3F),)
            ),
            CustomButton(text: "Próximo", screen: SelecionarTempo(), validation: 1,),
          ],
        ),
      ),
    );
  }
}

class CustomTextfield extends StatelessWidget {
  final String text;
  final Icon icon;

  const CustomTextfield({
    Key? key, required this.text, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 272,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: "RobotoRegular",
                  color: Color(0xFF676767),
                ),
              ),
              TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  icon: icon,
                ),
              ),],
          ),
        ),
      ),
    );
  }
}
