import 'package:davidzonecidadao/screens/PagamentoCartao.dart';
import 'package:davidzonecidadao/screens/PagamentoPix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';
import 'package:davidzonecidadao/screens/SelecionarTempo.dart';

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
                  imageheight: 137,
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
                  CustomTextBox(flatButton: FlatButton(
                    onPressed: () => setState(() => selectedRadio = 1),
                    minWidth: 270,
                    child: const Text(
                      "Cartão",
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
                      "Pix",
                      style: TextStyle(
                        fontFamily: "RobotoRegular",
                        fontSize: 14,
                      ),
                    ),
                  ),)
                ],),
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
                    if ( selectedRadio == 1 ) {
                      Navigator.push( context, MaterialPageRoute(builder: (context) => PagamentoCartao()));
                    } else if ( selectedRadio == 2 ) {
                      Navigator.push( context, MaterialPageRoute(builder: (context) => PagamentoPix()));
                    } else {
                      const snackBar = SnackBar(
                        content: Text('Selecione uma Opção'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text(
                    "Próximo",
                    style: TextStyle(
                      fontFamily: 'RobotoBold',
                      fontSize: 16,
                      color: Color(0xFFFFFFFF),
                    ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



