import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tiktok_clone/authentication/registration_screen.dart';
import 'package:tiktok_clone/widgets/input_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool showprogressBar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset("assets/images/tiktok.png",
              width: 200,
              ),
               Text(
                'Welcome',
                style: GoogleFonts.acme(
                  fontSize:34,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                )
              ),
              Text(
                  'Glad to see you!',
                  style: GoogleFonts.acme(
                    fontSize:34,
                    color: Colors.grey,
                  ),
              ),
              const SizedBox(
                height: 30,
              ),
              //email input
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                    textEditingController: emailTextEditingController,
                    lableString: "Email",
                    iconData: Icons.email_outlined,
                    isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //password input
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                    textEditingController: passwordEditingController,
                    lableString: "Password",
                    iconData: Icons.lock_outline,
                    isObscure: true,
                ),
              ),
              //login button
              //not have an account? signup button now
              const SizedBox(height: 30),
              showprogressBar == false
                  ?Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 38,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          showprogressBar = true;
                        });
                      },
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ):const SimpleCircularProgressBar(
                progressColors: [
                  Colors.green,
                  Colors.blue,
                  Colors.red,
                  Colors.amber,
                  Colors.blueAccent
                ],
                backColor: Colors.white30,
                animationDuration: 30,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not have an Account? ",style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16
                  ),),
                  InkWell(
                    onTap: ()
                    {
                    Get.to(RegistrationScreen());
                    },
                    child: const Text("SignUp Now",style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
