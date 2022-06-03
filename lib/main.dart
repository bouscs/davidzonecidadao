import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:davidzonecidadao/screens/ComprarTicket.dart';
import 'package:davidzonecidadao/screens/MapaMunicipal.dart';
import 'package:davidzonecidadao/screens/ConsultarTicket.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lottie/lottie.dart';
import 'firebase_options.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
      home: AnimatedSplashScreen(
        splash: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                  child: Lottie.asset('assets/loadingcircles.json')),
              SizedBox(
                height: 50,
                child: Wrap(
                  children: const [
                    Text(
                      'David',
                      style: TextStyle(
                        color: Color(0xFFECECEA),
                        fontFamily: "RobotoMedium",
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      'zone',
                      style: TextStyle(
                        color: Color(0xFF67DFDD),
                        fontFamily: "RobotoMedium",
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
                  child: Image.asset('assets/cidadao_box.png')),
            ],
          ),
        ),
        splashIconSize: 250,
        backgroundColor: Color(0xFF2D2D2D),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
        nextScreen: MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
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
                uppertext: 'Bem vindo!',
                image: SvgPicture.asset('assets/car_art.svg'),
                imageheight: 137,
                bottomtext: '',
              ),
              bottomContainer(),
            ],
          ),
        ],
      ),
      );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        alignment: const Alignment(0.0,1.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/pngappbar.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment(0.0,1.0)
          ),
        ),
      ),
      centerTitle: true,
      title: Wrap(
        children: const [
          Text(
            'David',
            style: TextStyle(
              color: Color(0xFFECECEA),
              fontFamily: "RobotoMedium",
              fontSize: 22,
            ),
          ),
          Text(
            'zone',
            style: TextStyle(
              color: Color(0xFF67DFDD),
              fontFamily: "RobotoMedium",
              fontSize: 22,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF505050),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Widget screen;
  final int validation;

  const CustomButton({
    Key? key, required this.text, required this.screen, required this.validation,
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
            if ( validation != 0 ) {
              Navigator.push( context, MaterialPageRoute(builder: (context) => screen),);
            } else {
              const snackBar = SnackBar(
                content: Text('Selecione uma Opção'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
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
  const bottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Column(
          children: [
            //SizedBox(
              //height: MediaQuery.of(context).size.height/2.5,
            //),
            CustomButton(text: 'Comprar Ticket', screen: ComprarTicket(), validation: 1,),
            //CustomButton(text: 'Consultar Ticket', screen: ConsultarTicket(), validation: 1,),
            CustomButton(text: 'Mapa Municipal', screen: MapaMunicipal(), validation: 1,),
          ],
        ),
      ),
    );
  }
}

class MarbleBackground extends StatelessWidget {
  const MarbleBackground({Key? key}) : super(key: key);

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
  final String uppertext;
  final String bottomtext;
  final SvgPicture image;
  final double imageheight;

  const upperContainer({
    Key? key, required this.uppertext, required this.bottomtext, required this.image, required this.imageheight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          //alignment: WrapAlignment.spaceBetween,
          spacing: 20,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                uppertext,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "RobotoMedium",
                  fontSize: 16,
                  color: Color(0xFF505050),
                ),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: imageheight,
                child: image
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                bottomtext,
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
    );
  }
}