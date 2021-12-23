import 'package:flutter/material.dart';
import 'package:social_media_app/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const String id = "sign_up_screen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>(); //нужно для Form()

  String _email = "";
  String _username = "";
  String _password = "";

  late final FocusNode _passwordFocusNode;
  late final FocusNode _usernameFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordFocusNode = FocusNode();
    _usernameFocusNode = FocusNode();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordFocusNode.dispose();
    _usernameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Text("Social Media App", style: Theme
                        .of(context)
                        .textTheme
                        .headline3,),
                  ),
                  SizedBox(height: 15,),
                  // email
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: "Enter your email"
                    ),
                    textInputAction: TextInputAction.next,//Кнопка далее на клавиатуре
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_usernameFocusNode);
                    },
                    onSaved: (value) {
                      _email = value!.trim();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please, enter your email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15,),
                  // user Name
                  TextFormField(
                    focusNode: _usernameFocusNode,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: "Enter your username"
                    ),
                    textInputAction: TextInputAction.next,//Кнопка "далее" на клавиатуре
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    onSaved: (value) {
                      _username = value!.trim();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please, enter your user Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15,),
                  // password
                  TextFormField(
                    //keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    focusNode: _passwordFocusNode,//закрывает символы
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: "Enter your password"
                    ),
                    textInputAction: TextInputAction.done,//Кнопка "готово" на клавиатуре
                    onFieldSubmitted: (_) {

                      //TODO Submit Form

                    },
                    onSaved: (value) {
                      _password = value!.trim();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please, enter your password";
                      }
                      if (value!.length < 5) {
                        return "Please enter 5 or more characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15,),
                  TextButton(onPressed: () {

                    //TODO Submit Form

                  },
                      child: Text("Sign Up")),
                  SizedBox(height: 15,),
                  TextButton(onPressed: () {
                    //Go to sign in screen
                    Navigator.of(context).pushReplacementNamed(SignInScreen.id);
                  },
                      child: Text("Sign In instead")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
