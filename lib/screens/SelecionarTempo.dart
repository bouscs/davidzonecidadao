import 'package:davidzonecidadao/screens/ComprarTicket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';
import 'package:davidzonecidadao/screens/SelecionarMetodoPagamento.dart';

class SelecionarTempo extends StatefulWidget {
  const SelecionarTempo({Key? key, required this.cidadaoInfo}) : super(key: key);

  final cidadaoInfo;

  @override
  State<SelecionarTempo> createState() => _SelecionarTempoState(cidadaoInfo);
}

class _SelecionarTempoState extends State<SelecionarTempo> {
  final cidadaoInfo;
  _SelecionarTempoState(this.cidadaoInfo);
  int selectedRadio = 0;

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
                Container(
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
                              CustomTextBox(
                                flatButton: FlatButton(
                                  onPressed: () => setState(() => selectedRadio = 1),
                                  minWidth: 270,
                                  child: Text(
                                    "1 Hora - R\$2,50",
                                    style: TextStyle(
                                      fontFamily: "RobotoRegular",
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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
                              CustomTextBox(
                                flatButton: FlatButton(
                                  onPressed: () => setState(() => selectedRadio = 2),
                                  minWidth: 270,
                                  child: const Text(
                                    "2 Horas - R\$5,00",
                                    style: TextStyle(
                                      fontFamily: "RobotoRegular",
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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
                              CustomTextBox(
                                flatButton: FlatButton(
                                  onPressed: () => setState(() => selectedRadio = 3),
                                  minWidth: 270,
                                  child: const Text(
                                    "3 Horas - R\$7,50",
                                    style: TextStyle(
                                      fontFamily: "RobotoRegular",
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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
                              CustomTextBox(
                                flatButton: FlatButton(
                                  onPressed: () => setState(() => selectedRadio = 4),
                                  minWidth: 270,
                                  child: const Text(
                                    "4 Horas - R\$10,00",
                                    style: TextStyle(
                                      fontFamily: "RobotoRegular",
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                            ],
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
                                if ( selectedRadio != 0 ) {
                                  int tempo = 0;
                                  double valor = 0.0;
                                  switch (selectedRadio) {
                                    case 1: {
                                      tempo = 60;
                                      valor = 2.5; }
                                    break;
                                    case 2: {
                                      tempo = 120;
                                      valor = 5.0; }
                                    break;
                                    case 3: {
                                      tempo = 180;
                                      valor = 7.5; }
                                    break;
                                    case 4: {
                                      tempo = 240;
                                      valor = 10.0; }
                                    break;
                                  }
                                  Navigator.push( context, MaterialPageRoute(builder: (context) => SelecionarMetodoPagamento(
                                    valor: valor,
                                    tempo: tempo,
                                    cidadaoInfo: cidadaoInfo,
                                  )),);
                                } else {
                                  const snackBar = SnackBar(
                                    content: Text('Selecione uma Opção'),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              },
                              child: Text(
                                'Próximo',
                                style: const TextStyle(
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
                ),
              ],
            ),
          ],
        ));
  }
}

class CustomTextBox extends StatelessWidget {
  final FlatButton flatButton;

  const CustomTextBox({
    Key? key,
    required this.flatButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                offset: const Offset(0, 4),
              )
            ]),
        child: flatButton);
  }
}
