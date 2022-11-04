import 'package:flutter/material.dart';
import 'my_shared_preferences.dart.dart';
import 'profile.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerUserName = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Container(
          width: double.infinity,
          height: 680,
          decoration: BoxDecoration(
              color: Colors.amber,
              gradient: LinearGradient(
                  colors: [Colors.grey, Colors.green, Colors.orange],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.all(25),
            child: Form(
              key: formKey,
              // autovalidate: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 77,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Email Id:", style: TextStyle(fontSize: 18)),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controllerEmail,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24)),
                            hintText: "Please enter email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("UserName:", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 13),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              hintText: "Please enter username",
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "UserName is Required";
                              }
                            },
                            controller: controllerUserName),
                      )
                    ],
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Password:", style: TextStyle(fontSize: 18)),
                      SizedBox(
                        width: 39,
                      ),
                      // SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              hintText: "Please enter password",
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Password is Required";
                              }
                            },
                            controller: controllerPassword),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 44,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.black,
                          backgroundColor: Colors.white),
                      onPressed: (() {}),
                      child: Text('Login with Gmail')),
                  SizedBox(height: 100),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: Text("Submit",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          var getEmail = controllerEmail.text;
                          var getUserName = controllerUserName.text;
                          var getPassword = controllerPassword.text;

                          MySharedPreferences.instance
                              .setStringValue("email", getEmail);
                          MySharedPreferences.instance
                              .setStringValue("username", getUserName);
                          MySharedPreferences.instance
                              .setStringValue("password", getPassword);
                          MySharedPreferences.instance
                              .setBooleanValue("loggedin", true);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => Profile()),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ])),
    );
  }
}
