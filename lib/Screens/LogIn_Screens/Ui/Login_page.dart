import 'package:flutter/material.dart';
import 'package:metro/Screens/LogIn_Screens/Ui/ForgetPassword_page.dart';
import 'package:metro/Screens/SignUp_Screens/Ui/SignUp_Page.dart';
import 'package:metro/models/login_model.dart';
import 'package:metro/services/login_service.dart';
import 'package:metro/widgets/Constants.dart';
import 'package:metro/widgets/CustomTextButton.dart';
import 'package:metro/widgets/CustomTextField.dart';
import 'package:metro/widgets/backIcon.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            shrinkWrap: true,
              children: [
              const backIcon(),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/Registration/home.jpg',
                height: 200,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                ' Login',
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 18,
              ),
              CustomTextField(
                  hintText: '  Username or email', contloller: emailController),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextField(
                  controller: passwordController,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        color: Colors.grey,
                        icon: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        }),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 12,
                    ),
                    hintText: "Password",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff2C2C2C),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffE1E1E1), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xffE1E1E1),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 240),
                child: CustomTextButton(
                  fontSize: 15,
                  fontcolor: const Color.fromARGB(255, 116, 116, 116),
                  text: 'Forget Password?',
                  page: ForgetPasswordPage(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      try {
                        await logInMethod();
                        // Assuming logInMethod() is an asynchronous function, await its completion before setting isLoading to false
                        setState(() {
                          isLoading = false;
                        });
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => AppHome()));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Enter a valid email and password'),
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please Enter your email and password'),
                        ),
                      );
                      setState(() {
                        isLoading = false;
                      });
                     }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      fixedSize: const Size(342, 48),
                      backgroundColor: kButtonColor),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Don\'t have an account ?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CustomTextButton(
                  fontcolor: Colors.black,
                  fontSize: 18,
                  text: 'Create Account',
                  page: const SignUpPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  logInMethod() async{
   await LogInService(context: context).logIn(
      logInModel: LogInModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }
}
