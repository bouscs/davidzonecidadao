import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';
import 'package:davidzonecidadao/screens/PagamentoRealizado.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';

class CodigoPix extends StatefulWidget {
  const CodigoPix({Key? key, required this.valor, required this.tempo, this.cidadaoInfo}) : super(key: key);

  final double valor;
  final int tempo;
  final cidadaoInfo;

  @override
  State<CodigoPix> createState() => _CodigoPixState( valor, tempo, cidadaoInfo);
}

class _CodigoPixState extends State<CodigoPix> {
  PaymentState state = PaymentState.loading;

  final double valor;
  final int tempo;
  final cidadaoInfo;
  _CodigoPixState(this.valor, this.tempo, this.cidadaoInfo);

  @override
  Widget build(BuildContext context) {
    final isDone = state == PaymentState.done;
    final color = isDone ? Colors.green : const Color(0xFF505050);
    String generateRandomString(int len) {
      var r = Random();
      const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
    };
    String codigo = generateRandomString(42);
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0,4),
                        )]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                    child: Wrap(
                      direction: Axis.vertical,
                      runAlignment: WrapAlignment.center,
                      spacing: 20,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Comprar Ticket',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: "RobotoMedium",
                              fontSize: 16,
                              color: Color(0xFF505050),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          alignment: Alignment.center,
                          child: QrImage(
                            data: codigo,
                            gapless: true,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Pagamento Pix',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: "RobotoMedium",
                                fontSize: 22,
                                color: Color(0xFF505050)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      child: Text(
                        codigo,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'RobotoRegular',
                          color: Color(0xFF323232),
                        ),
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
                      color: const Color(0xFF505050),
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
                      child: Wrap(
                        spacing: 10,
                        children: const [
                          Icon(Icons.copy, color: Colors.white, size: 20,),
                          Text(
                            'Copiar Código',
                            style: TextStyle(
                              fontFamily: 'RobotoBold',
                              fontSize: 16,
                              color: Color(0xFFFFFFFF),
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Wrap(
                    spacing: 15,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      Wrap(
                        spacing: 10,
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                            child: Center(
                              child: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: isDone
                                      ? const Icon(Icons.done, color: Colors.white, size: 15,) :
                                  const CircularProgressIndicator(color: Colors.white,)),
                            ),
                          ),
                          const Text(
                            'Aguardando Pagamento',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'RobotoRegular',
                              color: Color(0xFF505050),
                            ),)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 217,
                          height: 47,
                          decoration: BoxDecoration(
                            color: const Color(0xFF505050),
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
                            onPressed: () async {
                              var dadosPagamento = DadosPagamentoPix(
                                  cidadaoInfo.plate,
                                  cidadaoInfo.id,
                                  tempo,
                                  'Pix');
                              setState(() => state = PaymentState.done);
                              await Future.delayed(const Duration(milliseconds: 1500));
                              Navigator.push( context, MaterialPageRoute(builder: (context) => PagamentoRealizado(
                                dadosPagamento: dadosPagamento,
                              )),);
                            },
                            child: const Text(
                              'Simular Pagamento',
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
              ],
            ),
          ],
        )
    );
  }
}

class DadosPagamentoPix{
  String placa;
  String cpfCnpj;
  int tempo;
  String meioPagamento;
  DadosPagamentoPix(this.placa, this.cpfCnpj, this.tempo, this.meioPagamento);
}

enum PaymentState { loading, done }
