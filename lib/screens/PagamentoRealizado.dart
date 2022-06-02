import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';

class PagamentoRealizado extends StatelessWidget {
  const PagamentoRealizado({Key? key, this.dadosPagamento}) : super(key: key);
  final dadosPagamento;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF505050), Color(0xFF67DFDD)]
            )
          ),
          child: Center(
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 20,
              children: [
                //Icon(Icons.check_circle, color: Colors.white, size: 80,),
                Text(
                  'Pagamento Realizado!',
                  style: TextStyle(
                    fontFamily: 'RobotoMedium',
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Color(0xFF505050),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(7.0, 7.0),
                          )
                        ],
                      ),
                      width: MediaQuery.of(context).size.width/1.4,
                      height: MediaQuery.of(context).size.height/15,
                      alignment: Alignment.center,
                      child: Text('TICKET', style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'RobotoBold'),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/1.4,
                      height: MediaQuery.of(context).size.height/3,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(7.0, 7.0),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Wrap(
                          direction: Axis.vertical,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            ticketinfo(title: 'Placa', info: dadosPagamento.placa.toUpperCase()),
                            SizedBox(height: 15),
                            ticketinfo(title: 'Tempo', info: '${dadosPagamento.tempo} minutos'),
                            SizedBox(height: 15),
                            ticketinfo(title: 'Método de Pagamento', info: dadosPagamento.meioPagamento),
                            SizedBox(height: 15),
                            Wrap(
                              children: const [
                                Text(
                                  'David',
                                  style: TextStyle(
                                    color: Color(0xFF505050),
                                    fontFamily: "RobotoMedium",
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  'zone',
                                  style: TextStyle(
                                    color: Color(0xFF67DFDD),
                                    fontFamily: "RobotoMedium",
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: 15,
                                child: Image.asset('assets/cidadao_box.png')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                HomeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ticketinfo extends StatelessWidget {
  const ticketinfo({Key? key, required this.title, required this.info}) : super(key: key);
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
            title,
          style: TextStyle(
            fontFamily: 'RobotoRegular',
            fontSize: 12,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            fontFamily: 'RobotoMedium',
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}


class HomeButton extends StatelessWidget {

  const HomeButton({
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
          child: const Text(
            'Início',
            style: TextStyle(
              fontFamily: 'RobotoBold',
              fontSize: 16,
              color: Color(0xFFFFFFFF),
            ),),
        ),
      ),
    );
  }
}