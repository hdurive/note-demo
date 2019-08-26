import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notish/generated/i18n.dart';
import 'package:notish/locator.dart';
import 'package:notish/modules/home/views/home_view.dart';
import 'package:notish/modules/login/presenters/login_presenter.dart';
import 'package:notish/shared_state/loading.dart';
import 'package:notish/shared_state/shared_memory.dart';
import 'package:notish/utils/widgets/button_logo.dart';
import 'package:notish/utils/widgets/cflatbutton.dart';
import 'package:notish/utils/widgets/ctextfield.dart';
import 'package:notish/widgets/loading_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  static openView(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
    );
  }

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginPresenter = locator<LoginPresenter>();

  StreamSubscription streamSubscription;

  _listenStream() {
    streamSubscription = SharedMemory.streamIsLogged.stream.listen((value) {
      if (value != null) {
        HomeView.openView(context);
      } else {
        print("logeado error");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _listenStream();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CnLoading>.value(
            value: loginPresenter.cnLoading),
        ChangeNotifierProvider<CnLoginStatus>(
            builder: (context) => loginPresenter.cnLoginStatus),
      ],
      child: Scaffold(
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                      child: Stack(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              // Box decoration takes a gradient
                              gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            stops: [0.1, 0.5, 0.7, 0.9],
                            colors: [
                              // Colors are easy thanks to Flutter's Colors class.
                              Color(0xffC2506C),
                              Color(0xffC13B5E),
                              Color(0xffB13462),
                              Color(0xff96286A),
                            ],
                          )),
                          child: Stack(children: <Widget>[
                            FractionallySizedBox(
                              heightFactor: 0.4,
                              child: Image.asset(
                                'assets/images/background_up.png',
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                              ),
                            ),
                            Align(
                              alignment: Alignment(1, 1),
                              child: FractionallySizedBox(
                                widthFactor: 1,
                                child: Image.asset(
                                  'assets/images/background_down.png',
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(1, 1),
                              child: FractionallySizedBox(
                                heightFactor: 0.65,
                                child: Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  child: Column(children: <Widget>[
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 30, top: 10),
                                            child: Text(
                                              S.of(context).login,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Consumer<CnLoginStatus>(builder:
                                              (context, loginStatus, child) {
                                            return _builLoginControls(
                                                loginStatus.loginStatus,
                                                context);
                                          }),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: CFlatButton(
                                                S.of(context).forgotPassword,
                                                () {}),
                                          )
                                        ]),
                                    ButtonLogo(S.of(context).signUp, () {}),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 25),
                                            height: 1.5,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Text(
                                              S.of(context).social_login,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 25),
                                            height: 1.5,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            loginPresenter.loginSocial(
                                                LoginType.FACEBOOK);
                                          },
                                          child: Image.asset(
                                            'assets/images/facebook.png',
                                            height: 50,
                                            width: 50,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            loginPresenter
                                                .loginSocial(LoginType.GOOGLE);
                                          },
                                          child: Image.asset(
                                            'assets/images/google.png',
                                            height: 50,
                                            width: 50,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            )
                          ])),
                      LoadingView()
                    ],
                  ))));
        }),
      ),
    );
  }

  Widget _builLoginControls(
      LoginStatusEnum loginStatusEnum, BuildContext context) {
    bool isError = false;
    switch (loginStatusEnum) {
      case LoginStatusEnum.IDLE:
        isError = false;
        break;
      case LoginStatusEnum.ERROR_LOGIN:
        isError = true;
        break;
      case LoginStatusEnum.SUCCESS_LOGIN:
        isError = false;
        break;
    }
    CTextField username = CTextField(
        myController: userController,
        error: isError,
        icon: FontAwesomeIcons.envelope,
        name: S.of(context).username);
    CTextField password = CTextField(
        myController: passwordController,
        obscuredText: true,
        error: isError,
        icon: FontAwesomeIcons.lock,
        name: S.of(context).password);
    return Column(
      children: <Widget>[
        username,
        password,
      ],
    );
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }
}
