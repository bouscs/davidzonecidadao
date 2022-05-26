import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:davidzonecidadao/screens/CodigoPix.dart';
import 'package:davidzonecidadao/screens/PagamentoRealizado.dart';


class PagamentoCartao extends StatefulWidget {
  const PagamentoCartao({Key? key}) : super(key: key);

  @override
  _PagamentoCartao createState() => _PagamentoCartao();
}

class _PagamentoCartao extends State<PagamentoCartao> {
  String cardNumber = '';
  String expiryDate= '';
  String cardHolderName = '';
  String cvvCode= '';
  bool isCvvFocused = false;
  PaymentState state = PaymentState.loading;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isDone = state == PaymentState.done;
    final color = isDone ? Colors.green : const Color(0xFF505050);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: Column(
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
                padding: const EdgeInsets.all(10),
                child: CreditCardWidget(
                  onCreditCardWidgetChange: (brand) {
                    print(brand);
                  },
                  cardBgColor: Color(0xFF505050),
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,),
              ),
            ),
            Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                              image: const AssetImage('assets/marblebg.jpg'),
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.modulate)
                          )
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          CreditCardForm(cardNumber: cardNumber,
                            expiryDate: expiryDate,
                            cardHolderName: cardHolderName,
                            cvvCode: cvvCode,
                            onCreditCardModelChange: onCreditCardModelChange,
                            themeColor: Colors.blue,
                            formKey: formKey,
                            cardNumberDecoration: const InputDecoration(
                                prefixIcon: Icon(Icons.credit_card_outlined),
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white54,
                                labelText: 'Número do Cartão',
                                hintText: 'xxxx xxxx xxxx xxxx'
                            ),
                            expiryDateDecoration: const InputDecoration(
                                prefixIcon: Icon(Icons.event),
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white54,
                                labelText: 'Validade',
                                hintText: 'xx/xx'
                            ),
                            cvvCodeDecoration: const InputDecoration(
                                prefixIcon: Icon(Icons.pin),
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white54,
                                labelText: 'CVV',
                                hintText: 'xxx'
                            ),
                            cardHolderDecoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              filled: true,
                              fillColor: Colors.white54,
                              border: OutlineInputBorder(),
                              labelText: 'Nome do Titular',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only( top: 20),
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
                                        if (formKey.currentState!.validate()) {
                                          setState(() => state = PaymentState.done);
                                          await Future.delayed(
                                              const Duration(milliseconds: 1500));
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => const PagamentoRealizado()),);
                                        }
                                        else {
                                          const snackBar = SnackBar(
                                            content: Text('Informações inválidas'),
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        }
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
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel){
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
