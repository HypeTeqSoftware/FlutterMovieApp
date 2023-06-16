import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  Future<void> sendPasswordResetEmail() async {
    try {
      await auth.sendPasswordResetEmail(email: emailController.text.trim());
      Fluttertoast.showToast(
        msg: "We have sent you an email to reset your password. Please check your email.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
        textColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
      );
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
        textColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
      );
      print(error);
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
              const SizedBox(height: 40),
              Center(child: Image.asset("assets/app_logo.png")),
              const SizedBox(height: 24,),
              Text("FORGOT PASSWORD?",style: TextStyle(fontFamily: 'Gotham',color: Theme.of(context).brightness == Brightness.light ?Colors.black54 :Colors.white60,fontSize: 15,fontWeight: FontWeight.bold)),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: Text(
                    textAlign: TextAlign.center,
                    "Enter the email address you used to create your account and we will email you a link to reset your password",
                    style: TextStyle(fontFamily: 'Gotham',color: Theme.of(context).brightness == Brightness.light ?Colors.black54 :Colors.white60,fontSize: 15,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                      child: Text(
                        "Email", style: TextStyle(
                          fontFamily: 'Gotham',
                          color:Theme.of(context).brightness == Brightness.light ?Colors.black :Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
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
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email address";
                          } else if (!value.contains("@")) {
                            return "Please Enter Valid Email";
                          } else if (!value.contains(".com")) {
                            return "Please Enter Valid Email";
                          }
                          return null;
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            hintText: "Email here",
                            hintStyle: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black38:Colors.white60,
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
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        primary: Colors.amber.shade600,
                        minimumSize: const Size(340, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async{
                        if(_formKey.currentState!.validate()){
                          await sendPasswordResetEmail();
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen(),));
                        }else {
                          Fluttertoast.showToast(
                              msg: "Please fill all detail",
                              backgroundColor: Colors.black);
                        }

                      },
                      child: const Text(
                        'SEND EMAIL',
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
