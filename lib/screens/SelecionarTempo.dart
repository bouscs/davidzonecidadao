import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';
import 'package:davidzonecidadao/screens/SelecionarMetodoPagamento.dart';

class SelecionarTempo extends StatefulWidget {
  const SelecionarTempo({Key? key}) : super(key: key);

  @override
  State<SelecionarTempo> createState() => _SelecionarTempoState();
}

class _SelecionarTempoState extends State<SelecionarTempo> {
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
                  image: SvgPicture.asset('assets/hourglass.svg'),
                  imageheight: 137,
                  bottomtext: 'Selecione o tempo de estadia\ndesejado',
                ),
                const bottomContainerComprarTicket(),
              ],
            ),
          ],
        )
    );
  }
}

class bottomContainerComprarTicket extends StatefulWidget {
  const bottomContainerComprarTicket({Key? key}) : super(key: key);


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
                  CustomTextBox(flatButton: FlatButton(
                    onPressed: () => setState(() => selectedRadio = 1),
                    minWidth: 270,
                    child: const Text(
                      "1 Hora - R\$2,50",
                      style: TextStyle(
                        fontFamily: "RobotoRegular",
                        fontSize: 14,
                      ),
                    ),
                  ),)
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
                  CustomTextBox(flatButton: FlatButton(
                    onPressed: () => setState(() => selectedRadio = 2),
                    minWidth: 270,
                    child: const Text(
                      "2 Horas - R\$5,00",
                      style: TextStyle(
                        fontFamily: "RobotoRegular",
                        fontSize: 14,
                      ),
                    ),
                  ),)
                ],),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<int>(
                      value: 3,
                      groupValue: selectedRadio,
                      onChanged: (value) => setState(() => selectedRadio = 3)),
                  CustomTextBox(flatButton: FlatButton(
                    onPressed: () => setState(() => selectedRadio = 3),
                    minWidth: 270,
                    child: const Text(
                      "3 Horas - R\$7,50",
                      style: TextStyle(
                        fontFamily: "RobotoRegular",
                        fontSize: 14,
                      ),
                    ),
                  ),)
                ],),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<int>(
                      value: 4,
                      groupValue: selectedRadio,
                      onChanged: (value) => setState(() => selectedRadio = 4)),
                  CustomTextBox(flatButton: FlatButton(
                    onPressed: () => setState(() => selectedRadio = 4),
                    minWidth: 270,
                    child: const Text(
                      "4 Horas - R\$10,00",
                      style: TextStyle(
                        fontFamily: "RobotoRegular",
                        fontSize: 14,
                      ),
                    ),
                  ),)
                ],),
            ),
            CustomButton(text: "Próximo", screen: const SelecionarMetodoPagamento(), validation: selectedRadio,)
          ],
        ),
      ),
    );
  }
}

class CustomTextBox extends StatelessWidget {
  final FlatButton flatButton;

  const CustomTextBox({
    Key? key, required this.flatButton,
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
      child: flatButton
    );
  }
}


