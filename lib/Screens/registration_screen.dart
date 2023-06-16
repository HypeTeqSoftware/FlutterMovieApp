import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photoplay_app/Screens/login_screen.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool passToggle = true;
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conformpasswordController = TextEditingController();

  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final conformpasswordFocusNode = FocusNode();

  Future<void> registration() async {
    try {
      if (passwordController.text != conformpasswordController.text) {
        throw FirebaseAuthException(
          code: 'Passwords do not match',
          // message: 'Passwords do not match',
        );
      }
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text)
          .then((_) {
        Fluttertoast.showToast(
          msg: "Registration successfully,Please Login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor:Theme.of(context).brightness == Brightness.light ?Colors.black :Colors.white,
          textColor: Theme.of(context).brightness == Brightness.light ?Colors.white :Colors.black,
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).brightness == Brightness.light ?Colors.black :Colors.white,
          content: Text(
            e.code,
            style: TextStyle(fontSize: 18.0,color:Theme.of(context).brightness == Brightness.light ?Colors.white :Colors.black,),
          ),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ?Colors.grey.shade100 :Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).brightness == Brightness.light ?Colors.grey.shade100 :Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
                child: Image.asset("assets/back_btn.png",height: 15,color: Colors.grey,)),
            const SizedBox(width: 8),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
                child: const Text("Back",style: TextStyle(fontFamily: 'Gotham',color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),))
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 90,
                  width: 90,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // changes the shadow direction
                        ),
                      ],
                      color: Theme.of(context).brightness == Brightness.light ?Colors.white :null,
                      shape: BoxShape.circle
                  ),
                  child: Image.asset("assets/user_placeholder.png"),
                ),
              ),
              const SizedBox(height: 10,),
              Text("Add Profile picture",style: TextStyle(fontFamily: 'Gotham',color:Theme.of(context).brightness == Brightness.light ? Colors.black54 :Colors.white54,fontSize: 14,fontWeight: FontWeight.bold)),
              const SizedBox(height: 8,),
              textFieldWidget(title: "First Name",hinttext: "First name here",
                controller: firstnameController,
                focusNode: firstNameFocusNode,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:(value) {
                  if(value!.isEmpty){
                    return "Please enter firstname";
                  }
                  return null;
                },),
              textFieldWidget(title: "Last Name",hinttext: "Last name here",
                  controller: lastnameController,
                  focusNode: lastNameFocusNode,
                  autovalidateMode: lastNameFocusNode.hasFocus
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  validator:(value) {
                    if(value!.isEmpty){
                      return "Please enter lastname";
                    }
                    return null;
                  },
                onChanged: (val){
                setState(() {
                  lastNameFocusNode.hasFocus;
                });
                }
              ),
              textFieldWidget(title:"Email",hinttext:"Email here",
                controller: emailController,
                focusNode: emailFocusNode,
                autovalidateMode: emailFocusNode.hasFocus
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Please enter email address";
                  } else if (!value.isValidEmail()) {
                    return "Please Enter Valid Email";
                  }
                  return null;
                },
                  onChanged: (val){
                    setState(() {
                      emailFocusNode.hasFocus;
                    });
                  }
              ),
              textFieldWidget(title:"Password",hinttext:"Password here",
                controller: passwordController,
                  focusNode: passwordFocusNode,
                  autovalidateMode: passwordFocusNode.hasFocus
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Password";
                  } else if (value.length < 6) {
                    return "Please enter at least 6 digit";
                  }
                  return null;
                },
                obscureText: passToggle,
                  onChanged: (val){
                    setState(() {
                      passwordFocusNode.hasFocus;
                    });
                  }
              ),
              textFieldWidget(title:"Conform Password",hinttext: "Conform Password here",
                controller: conformpasswordController,
                focusNode: conformpasswordFocusNode,
                autovalidateMode: conformpasswordFocusNode.hasFocus
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Password";
                  } else if (value.length < 6) {
                    return "Please enter at least 6 digit";
                  }
                  return null;
                },
                  obscureText: passToggle,
                  onChanged: (val){
                    setState(() {
                      conformpasswordFocusNode.hasFocus;
                    });
                  }
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Colors.amber.shade600,
                    minimumSize: const Size(340, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async{
                    if (_formKey.currentState!.validate()) {
                      await registration();
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please fill all detail",
                          backgroundColor: Colors.black);
                    }
                    },
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
  Widget textFieldWidget(
      {String? title, String? hinttext, String? Function(String?)? validator,bool obscureText = false,
        required TextEditingController controller,
        required FocusNode focusNode,
        void Function(String)? onChanged,
        required AutovalidateMode autovalidateMode}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Padding(
            padding: const EdgeInsets.only(bottom: 5,left: 10),
            child: Text(
              title!, style:  TextStyle(
                fontFamily: 'Gotham',
                color:Theme.of(context).brightness == Brightness.light ?Colors.black :Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes the shadow direction
                ),
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextFormField(
              focusNode: focusNode,
              autovalidateMode: autovalidateMode,
              controller: controller,
              obscureText: obscureText,
              validator: validator,
              onChanged: onChanged,
              cursorColor:  Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white,
              decoration: InputDecoration(
                hintText: hinttext,
                hintStyle:TextStyle(
                  color:  Theme.of(context).brightness == Brightness.light ? Colors.black38:Colors.white60
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 20.0),
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.light ? Colors.white:Colors.grey.shade800,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
