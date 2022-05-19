import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_svg/flutter_svg.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBar(
          flexibleSpace: Container(
            alignment: Alignment(0.0,1.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pngappbar.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment(0.0,1.0)
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Davidzone',
            style: TextStyle(
              color: Color(0xFFECECEA),
              fontFamily: "RobotoMedium",
              fontSize: 22,
            ),
          ),
          backgroundColor: const Color(0xFF505050),
        ),
      ),
      body: Stack(
        children: [
          MarbleBackground(),
          upperContainer(),
          bottomContainer(),
        ],
      )
      );
  }
}

class CustomButton extends StatelessWidget {
  final String text;

  CustomButton({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 217,
        height: 47,
        decoration: BoxDecoration(
          color: Color(0xFF505050),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ],
            ),
        child: FlatButton(
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'RobotoBold',
              fontSize: 16,
              color: Color(0xFFFFFFFF),
            ),),
        ),
      ),
    );
  }
}

class bottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/2.5,
          ),
          CustomButton(text: 'Comprar Ticket'),
          CustomButton(text: 'Regularizar Veículo'),
          CustomButton(text: 'Mapa Municipal'),
        ],
      ),
    );
  }
  }

class MarbleBackground extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: const AssetImage('assets/marblebg.jpg'),
        colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.modulate)
      )
    ),
  );
}
}

class upperContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3.1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0,4),
          )]
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height/16,
              child: const Text(
                'Status do Veiculo',
                style: TextStyle(
                  fontFamily: "RobotoRegular",
                  fontSize: 16,
                  color: Color(0xFF505050),
                ),
              ),
            ),
            SvgPicture.asset('assets/car_art.svg'),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height/14,
              child: const Text(
                'Você não está estacionado',
                style: TextStyle(
                    fontFamily: "RobotoMedium",
                    fontSize: 22,
                    color: Color(0xFF505050)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}