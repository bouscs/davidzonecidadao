import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';

class PagamentoRealizado extends StatelessWidget {
  const PagamentoRealizado({Key? key}) : super(key: key);

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
              children: const [
                Icon(Icons.check_circle, color: Colors.white, size: 80,),
                Text(
                  'Pagamento Realizado!',
                  style: TextStyle(
                    fontFamily: 'RobotoMedium',
                    fontSize: 24,
                    color: Colors.white,
                  ),
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