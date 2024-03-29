import 'package:cloud_firestore/cloud_firestore.dart';
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
        ));
  }
}

class bottomContainerComprarTicket extends StatefulWidget {
  @override
  _bottomContainerComprarTicket createState() {
    return new _bottomContainerComprarTicket();
  }
}

class _bottomContainerComprarTicket
    extends State<bottomContainerComprarTicket> {
  // const bottomContainerComprarTicket({Key? key}) : super(key: key);

  int verify = 0;
  Future getVeiculos(placa) async {
    await FirebaseFirestore.instance.collection('veiculos')
        .where("placa", isEqualTo: placa)
        .get().then(
            (snapshot) => snapshot.docs.forEach((document) {
          verify = 1;
        }));
  }

  final _plate = TextEditingController();
  final _id = TextEditingController();
  bool _validateId = false;
  bool _validatePlate = false;

  @override
  void dispose() {
    _plate.dispose();
    _id.dispose();
    super.dispose();
  }

  bool verifyPlate(String plate) {
    const letters = 3;
    const nums = 4;

    plate = plate.toUpperCase();
    // Check the length
    if (plate.length != (letters + nums)) {
      return false;
    }
    // Check the letters
    for (int l = 0; l < letters; l++) {
      if (!plate[l].contains(new RegExp(r'[A-Z]'))) {
        return false;
      }
    }
    // Check the numbers
    for (int n = letters; n < (letters + nums); n++) {
      if (!plate[n].contains(new RegExp(r'[0-9]'))) {
        return false;
      }
    }
    return true;
  }

  bool verifyMercosulPlate(String plate) {
    const letters = 4;
    const nums = 3;

    plate = plate.toUpperCase();

    if (plate.length != (letters + nums)) {
      return false;
    }

    for (int l = 0; l < 3; l++) {
      if (!plate[l].contains(new RegExp(r'[A-Z]'))) {
        return false;
      }
    }

    if (!plate[3].contains(new RegExp(r'[0-9]'))) {
      return false;
    }

    if (!plate[4].contains(new RegExp(r'[A-Z]'))) {
      return false;
    }

    for (int n = 5; n < 7; n++) {
      if (!plate[n].contains(new RegExp(r'[0-9]'))) {
        return false;
      }
    }
    return true;
  }

  int verifyId(String id) {
    const cpfLen = 11;
    const cnpjLen = 14;
    if ((id.length != cpfLen) && (id.length != cnpjLen)) {
      return 1; // Não é nem CNPJ nem CPF por falta de numeros
    } else if (id.length == cpfLen) {
      for (int i = 0; i < (cpfLen); i++) {
        if (!id[i].contains(new RegExp(r'[0-9]'))) {
          return 2; // Não é CPF porque CPF deve conter apenas números
        }
      }
    } else if (id.length == cnpjLen) {
      for (int i = 0; i < (cnpjLen); i++) {
        if (!id[i].contains(new RegExp(r'[0-9]'))) {
          return 3; // Não é CNPJ porque CNPJ deve conter apenas números
        }
      }
    }
    return 0;
  }

  String getIdMessage(int idCode) {
    late String message;
    if (idCode == 1) {
      message = "Não possui digitos suficientes";
    } else if (idCode == 2) {
      message = "CPF deve conter apenas números";
    } else if (idCode == 3) {
      message = "CNPJ deve conter apenas números";
    }

    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
        // padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _plate,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.directions_car),
                filled: true,
                fillColor: Colors.white54,
                border: OutlineInputBorder(),
                labelText: 'Placa',
                hintText: 'ABC1234',
                errorText: _validatePlate ? "Digite uma placa válida" : null,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _id,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Colors.white54,
                border: OutlineInputBorder(),
                labelText: 'CPF/CNPJ',
                hintText: 'xxx xxx xxx xx',
                errorText: _validateId
                    ? getIdMessage(verifyId(_id.text.toString()))
                    : null,
              ),
            ),
            SizedBox(
              height: 50,
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
                  onPressed: () async {
                    setState(() {
                      verifyId(_id.text.toString()) != 0
                          ? _validateId = true
                          : _validateId = false;
                      verifyPlate(_id.text.toString()) ||
                              verifyMercosulPlate(_id.text.toString()) == true
                          ? _validatePlate = true
                          : _validatePlate = false;
                    });
                    if (!_validateId && !_validatePlate) {
                      await getVeiculos(_plate.text);
                      if (verify==1) {
                        var cidadaoInfo = CidadaoInfo(
                            _id.text.toString(), _plate.text.toString());
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Atenção!'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text(
                                          'Confirme sua Placa, Não há reembolso por erro de digitação.'),
                                      SizedBox(height: 15),
                                      Text(
                                          'Placa: ${cidadaoInfo.plate.toUpperCase()}'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Editar')),
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SelecionarTempo(
                                                    cidadaoInfo: cidadaoInfo,
                                                  )),
                                        );
                                      },
                                      child: Text('Confirmar'))
                                ],
                              );
                            });
                        verify = 0;
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Atenção!'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text('Veiculo não encontrado na base de dados'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Ok')),
                                ],
                              );
                            });
                      }

                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelecionarTempo(
                              cidadaoInfo: cidadaoInfo,
                            )),
                      );
                      */
                    }
                  },
                  child: Text(
                    "Proximo",
                    style: const TextStyle(
                      fontFamily: 'RobotoBold',
                      fontSize: 16,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CidadaoInfo {
  String id;
  String plate;
  CidadaoInfo(this.id, this.plate);
}

/*
class CustomTextfield extends StatelessWidget {
  final String text;
  final Icon icon;

  const CustomTextfield({
    Key? key,
    required this.text,
    required this.icon,
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
                offset: const Offset(0, 4),
              )
            ]),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
