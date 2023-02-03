import 'package:flutter/material.dart';
import '../utils/routes.dart';

// ignore: camel_case_types
class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);
  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  String name="";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, MyRoutes.home);
      setState(() {
        changeButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Counting App"),
    //   ),
    //   body: const Center(
    //     child: Text("Login Page",
    //     style: TextStyle(
    //       fontSize: 25,
    //         color: Colors.red,
    //         fontWeight: FontWeight.w400,
    //     ),
    //       // textScaleFactor: 1.5,
    //     ),
    //   ),
    // );
    //
    return Material(

      child: SingleChildScrollView(
      child: Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset("assets/images/login.png",
              fit: BoxFit.cover,
              // height: 700,
            ),
            const SizedBox(
              height: 25.0,
            ),
             Text(
              "Welcome $name.",
              style: const TextStyle(
                fontSize: 25,
                color: Colors.deepPurple
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
          // Padding(padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter UserName",
                      labelText: "Username",
                    ),
                    validator: (value){
                      bool isEmpty = value?.isEmpty ?? false;
                      if (isEmpty){
                        return "Username cannot be Empty";
                      }
                      else {
                           return null;
                      }
                    },
                    onChanged: (value){
                      name=value;
                      setState(() {  });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (value){
                      bool isEmpty = value?.isEmpty ?? false;
                      if (isEmpty){
                        return"Password cannot be empty";
                      }
                      else if((value?.length ?? 0) < 8){
                        return"Password should be greater then 8";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  InkWell(
                    onTap:() => moveToHome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changeButton? 50: 150,
                      height: 50,
                      // color: Colors.deepPurple,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        // shape: changeButton
                        //     ? BoxShape.circle
                        //     : BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(changeButton?50:10),
                      ),
                      child: changeButton
                          ? const Icon(Icons.done,
                          color:Colors.white)
                      : const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white, fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.home);
                  //   },
                  //   style: TextButton.styleFrom(minimumSize: const Size(150,40)),
                  //   child: const Text("Login"),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
      ),
    );
  }
}
