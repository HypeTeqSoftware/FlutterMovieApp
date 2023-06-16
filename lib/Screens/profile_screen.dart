import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photoplay_app/Providers/theme_provider.dart';
import 'package:photoplay_app/Screens/login_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

void signOutUser(context) async{
  FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser = auth.currentUser;
  if(currentUser != null){
    try{
      await currentUser.delete().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),)));
    }on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
        e.code,
        style: const TextStyle(fontSize: 18.0),
      ),),);
    }
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ?Colors.grey.shade100 :Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children:[
            const SizedBox(height: 70,),
            Center(
              child: Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image:AssetImage("assets/profilegirl.jpg"),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                  border: Border.all(
                    color: Colors.amber,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text("Tarun Prasad",style: TextStyle(fontFamily: 'Gotham',color: Theme.of(context).brightness == Brightness.light ?Colors.black :Colors.white,fontSize: 22,)),
            const SizedBox(height: 5),
            Text("Premium",style: TextStyle(fontFamily: 'Gotham',color: Theme.of(context).brightness == Brightness.light ?Colors.amber :Colors.amber,fontSize: 16,)),
            const SizedBox(height: 40),
            profileItem(Icons.person, "Account"),
            SizedBox(
              width: 330,
                child: Divider(color: Theme.of(context).brightness == Brightness.light ? Colors.black54 : Colors.white60,)),
            InkWell(
              onTap: (){
                themeDialogBox();
              },
                child: profileItem(Icons.light_mode, "Theme")),
            SizedBox(
                width: 330,
                child: Divider(color: Theme.of(context).brightness == Brightness.light ? Colors.black54 : Colors.white60,)),
            profileItem(Icons.settings, "Setting"),
            SizedBox(
                width: 330,
                child: Divider(color: Theme.of(context).brightness == Brightness.light ? Colors.black54 : Colors.white60,)),
            profileItem(Icons.help, "Help"),
            SizedBox(
                width: 330,
                child: Divider(color: Theme.of(context).brightness == Brightness.light ? Colors.black54 : Colors.white60,)),
            InkWell(
              onTap: (){
                signOutUser(context);
              },
                child: profileItem(Icons.logout_rounded, "Logout"))


          ],
        ),
      ),
    );
  }
  Widget profileItem(IconData icon,String name){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon,color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,),
              const SizedBox(width: 15,),
              Text(name,style: TextStyle(fontFamily: 'Gotham',fontSize: 18,color:Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white ),)

            ],
          )
        ],
      ),
    );
  }

  themeDialogBox(){
    final themeChanger=Provider.of<ThemeChangerProvider>(context,listen: false);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10,
            backgroundColor:Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.grey.shade900,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            title: Text("Change Theme",
                style:  TextStyle(
                      color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
            content: Container(
              height: 180,
              child: Column(
                children: [
                  RadioListTile<ThemeMode>(
                      title: const Text("Light Mode",style: TextStyle(fontWeight: FontWeight.bold),),
                      value: ThemeMode.light,
                      groupValue: themeChanger.themeMode,
                      onChanged:(value) {
                        themeChanger.setTheme(value);
                        Navigator.pop(context);
                      }
                  ),
                  RadioListTile<ThemeMode>(
                      title: const Text("Dark Mode",style: TextStyle(fontWeight: FontWeight.bold)),
                      value: ThemeMode.dark,
                      groupValue: themeChanger.themeMode,

                      onChanged:(value) {
                        themeChanger.setTheme(value);
                        Navigator.pop(context);
                      }
                  ),
                  RadioListTile<ThemeMode>(
                      title: const Text("System Mode",style: TextStyle(fontWeight: FontWeight.bold)),
                      value: ThemeMode.system,
                      groupValue: themeChanger.themeMode,
                      onChanged:(value) {
                        themeChanger.setTheme(value);
                        Navigator.pop(context);
                      }
                  )
                ],
              ),
            ),
          );
        });
  }
}
