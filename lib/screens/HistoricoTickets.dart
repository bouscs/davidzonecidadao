import 'package:flutter/material.dart';
import 'package:davidzonecidadao/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HistoricoTickets extends StatefulWidget {
  const HistoricoTickets({Key? key, required this.cpfCnpj, required this.placa}) : super(key: key);

  final String cpfCnpj;
  final String placa;

  @override
  State<HistoricoTickets> createState() => _HistoricoTicketsState(cpfCnpj, placa);
}

class _HistoricoTicketsState extends State<HistoricoTickets> {

  List<String> tempo = [];
  List<String> validade = [];
  List<String> meioPagamento = [];
  List<String> placaTicket = [];
  List<Timestamp> validadestamp = [];

  Future getValidades() async {
    await FirebaseFirestore.instance.collection('tickets')
        .where("cpfCnpj", isEqualTo: cpfCnpj)
        .where("placa", isEqualTo: placa)
        .get().then(
            (snapshot) => snapshot.docs.forEach((document) {
              tempo.add(document.get("tempo").toString());
              validade.add(DateFormat('dd/MM/yy - kk:mm').format(document.get("termino").toDate()));
              meioPagamento.add(document.get("meioPagamento").toString());
              placaTicket.add(document.get("placa").toString());
              validadestamp.add(document.get("termino"));
            }));
  }

  final String cpfCnpj;
  final String placa;
  _HistoricoTicketsState(this.cpfCnpj, this.placa);

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
          Expanded(
            child: FutureBuilder(
              future: getValidades(),
              builder: (context, snapshot) {
                List<String> reversetempo = tempo.reversed.toList();
                List<String> reversevalidade = validade.reversed.toList();
                List<String> reversemeioPagamento = meioPagamento.reversed.toList();
                List<String> reverseplacaTicket = placaTicket.reversed.toList();
                List<Timestamp> reversevalidadestamp = validadestamp.reversed.toList();
                return ListView.builder(
                    itemCount: tempo.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                height: MediaQuery.of(context).size.height/20,
                                alignment: Alignment.center,
                                child: TicketState(validade: reversevalidadestamp[index])
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/1.4,
                              height: MediaQuery.of(context).size.height/7,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  direction: Axis.vertical,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 3,
                                  children: [
                                    Text('Placa: ${reverseplacaTicket[index].toUpperCase()}',
                                    style: TextStyle(
                                      fontFamily: 'RobotoMedium',
                                      fontSize: 15,
                                    ),),
                                    Text('Validade: ${reversevalidade[index]}',
                                      style: TextStyle(
                                        fontFamily: 'RobotoMedium',
                                        fontSize: 15,
                                      ),),
                                    Text('Tempo comprado: ${reversetempo[index]} minutos',
                                      style: TextStyle(
                                        fontFamily: 'RobotoMedium',
                                        fontSize: 15,
                                      ),),
                                    Text('Método de Pagamento: ${reversemeioPagamento[index]}',
                                      style: TextStyle(
                                        fontFamily: 'RobotoMedium',
                                        fontSize: 15,
                                      ),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              },
            )
          ),
        ],
      ),
    );
  }
}

class TicketState extends StatelessWidget {
  const TicketState({Key? key, required this.validade,}) : super(key: key);
  final Timestamp validade;

  getState () {
    if (validade.compareTo(Timestamp.now())>0) {
      return Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 5),
          Text('VÁLIDO', style: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'RobotoBold'
          ),),
        ],
      );
    }
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 5),
        Text('EXPIRADO', style: TextStyle(
            color: Colors.white, fontSize: 20, fontFamily: 'RobotoBold'
        ),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return getState();
  }
}


