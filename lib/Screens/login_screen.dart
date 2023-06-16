import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:photoplay_app/Screens/forgot_password_screen.dart';
import 'package:photoplay_app/Screens/navbar_roots.dart';
import 'package:photoplay_app/Screens/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;
  final _formKey = GlobalKey<FormState>();
  var email = "";
  var password = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Fluttertoast.showToast(
          msg: "Login successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor:Theme.of(context).brightness == Brightness.light ?Colors.black :Colors.white,
          textColor:Theme.of(context).brightness == Brightness.light ?Colors.white :Colors.black,
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NavbarRoots(),
            ));
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).brightness == Brightness.light ?Colors.black :Colors.white,
          content: Text(
            e.code,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
  }

  googleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var reslut = await googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential).then((value){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NavbarRoots(),
            ));
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Theme.of(context).brightness == Brightness.light ? const AssetImage("assets/bgimg.png") :const AssetImage("assets/black theme bg.png"),
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.3),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100,),
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light ?Colors.white :null,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Image.asset("assets/app_logo.png"),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 260.0, bottom: 5),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 260.0, bottom: 5),
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
                          cursorColor:  Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white,
                          decoration: InputDecoration(
                            hintText: "Email here",
                            hintStyle: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black38:Colors.white60
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            filled: true,
                            fillColor: Theme.of(context).brightness == Brightness.light ? Colors.white:Colors.grey.shade900,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14,),
                      Padding(
                        padding: const EdgeInsets.only(right: 245.0, bottom: 5),
                        child: Text(
                          "Password",
                          style: TextStyle(
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
                          controller: passwordController,
                          obscureText: passToggle,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Password";
                            } else if (value.length < 6) {
                              return "Please enter at least 6 digit";
                            }
                            return null;
                          },
                          cursorColor: Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white,
                          decoration: InputDecoration(
                            hintText: "Password here",
                            hintStyle: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black38:Colors.white60
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            filled: true,
                            fillColor:Theme.of(context).brightness == Brightness.light ? Colors.white:Colors.grey.shade900,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 230,top: 10),
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen(),));
                            },
                            child: const Text("FORGOT?",style: TextStyle(fontFamily: 'Gotham',fontWeight: FontWeight.bold),)),
                      ),
                      const SizedBox(height: 14,),
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
                            var pref = await SharedPreferences.getInstance();
                            pref.setBool("Login", true);
                            setState(() {
                              email = emailController.text;
                              password = passwordController.text;
                            });
                            await  userLogin();
                          }else {
                            Fluttertoast.showToast(
                                msg: "Please fill all detail",
                                backgroundColor: Colors.redAccent);
                          }

                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 1,
                          width: 100,
                          color:Theme.of(context).brightness == Brightness.light ?Colors.black26 :Colors.white30,
                        ),
                       Text("Social Logins",style: TextStyle(fontFamily: 'Gotham',fontWeight: FontWeight.w600,fontSize: 12,
                            color: Theme.of(context).brightness == Brightness.light ?Colors.black54 :Colors.white,),),
                        Container(
                          height: 1,
                          width: 100,
                          color: Theme.of(context).brightness == Brightness.light ?Colors.black26 :Colors.white30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 135),
                      child: Row(
                        children: [
                          Image.asset("assets/fb_btn.png",height: 40,),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: (){
                              googleLogin();
                            },
                              child: Image.asset("assets/google_btn.png",height: 40,)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Text("Don't have an account?",style: TextStyle(color: Theme.of(context).brightness == Brightness.light ?Colors.black38 :Colors.white30,),),
                    const SizedBox(height: 5,),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen(),));
                        },
                        child: const Text("REGISTER",style: TextStyle(fontFamily: 'Gotham',fontWeight: FontWeight.w600),))
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );

  }
}
