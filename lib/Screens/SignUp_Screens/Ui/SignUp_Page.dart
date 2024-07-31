import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metro/models/sign_up_model.dart';
import 'package:metro/services/signUp_service.dart';
import 'package:metro/widgets/SignUp_Label.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  bool showFnameError = false;
  bool showLnameError = false;
  bool showEmailError = false;
  bool showNationalIdError = false;
  bool showPasswordIdError = false;
  bool showConfirmPasswordIdError = false;
  bool obscureText = false;
  bool isCheck = false;
  bool isShow = true;
  bool isLoading = false;

  bool _isFirstnameValid(String Fname) {
    return RegExp(r'^[a-zA-Z]{3,10}$').hasMatch(Fname);
  }

  bool _isLirstnameValid(String Lname) {
    return RegExp(r'^[a-zA-Z]{3,10}$').hasMatch(Lname);
  }

  bool isEmailValid(String email) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  bool _isPasswordMismatch() {
    return passwordController.text != confirmPasswordController.text; // true
  }

  bool isPasswordValid(String password) {
    return RegExp(
            r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*#?&])([a-zA-Z0-9@$!%*#?&]{6,})$')
        .hasMatch(password);
  }

  bool _isNationalIdValid(String nationalId) {
    return nationalId.length == 14 && int.tryParse(nationalId) != null;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SignUpLabel(),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 180,
                        child: TextField(
                          controller: firstNameController,
                          onChanged: (firstNameController) {
                            setState(() {
                              showFnameError =
                                  !_isFirstnameValid(firstNameController);
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 18,
                              horizontal: 12,
                            ),
                            hintText: "First name",
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff2C2C2C),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: showFnameError
                                      ? Colors.red
                                      : const Color(0xffE1E1E1),
                                  width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: showFnameError
                                    ? Colors.red
                                    : const Color(0xffE1E1E1),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: TextField(
                          controller: lastNameController,
                          onChanged: (lastNameController) {
                            setState(() {
                              showLnameError =
                                  !_isLirstnameValid(lastNameController);
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 18,
                              horizontal: 12,
                            ),
                            hintText: "Last name",
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff2C2C2C),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: showLnameError
                                      ? Colors.red
                                      : const Color(0xffE1E1E1),
                                  width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: showLnameError
                                    ? Colors.red
                                    : const Color(0xffE1E1E1),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Visibility(
                          visible: showFnameError,
                          child: const Text(
                            'please enter a valid name',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFF0914),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Visibility(
                          visible: showLnameError,
                          child: const Text(
                            'please enter a valid name',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFF0914),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: emailController,
                onChanged: (emailController) {
                  setState(() {
                    showEmailError = !isEmailValid(emailController);
                  });
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 12,
                  ),
                  hintText: "Email",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff2C2C2C),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: showEmailError
                            ? Colors.red
                            : const Color(0xffE1E1E1),
                        width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          showEmailError ? Colors.red : const Color(0xffE1E1E1),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Visibility(
                  visible: showEmailError,
                  child: const Text(
                    'please enter a valid Email',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFF0914),
                    ),
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: nationalIdController,
                onChanged: (nationalIdController) {
                  setState(() {
                    showNationalIdError =
                        !_isNationalIdValid(nationalIdController);
                  });
                },
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
                  hintText: "National ID",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff2C2C2C),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: showNationalIdError
                            ? Colors.red
                            : const Color(0xffE1E1E1),
                        width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: showNationalIdError
                          ? Colors.red
                          : const Color(0xffE1E1E1),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Visibility(
                  visible: showNationalIdError &&
                      nationalIdController.text.isNotEmpty,
                  child: const Text(
                    'please enter a valid ID',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFF0914),
                    ),
                  ),
                ),
              ),
              TextField(
                enableInteractiveSelection: false,
                controller: passwordController,
                onChanged: (passwordController) {
                  setState(() {
                    showPasswordIdError = !isPasswordValid(passwordController);
                  });
                },
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
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: showPasswordIdError
                            ? Colors.red
                            : const Color(0xffE1E1E1),
                        width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: showPasswordIdError
                          ? Colors.red
                          : const Color(0xffE1E1E1),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Visibility(
                  visible: showPasswordIdError,
                  child: const Text(
                    'please enter a valid password. Must be a minimum of 8 characters',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFF0914),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                enableInteractiveSelection: false,
                controller: confirmPasswordController,
                onChanged: (confirmPasswordController) {
                  setState(() {
                    showConfirmPasswordIdError = _isPasswordMismatch();
                  });
                },
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
                  hintText: "Confirm Password",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff2C2C2C),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: showConfirmPasswordIdError
                            ? Colors.red
                            : const Color(0xffE1E1E1),
                        width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: showConfirmPasswordIdError
                          ? Colors.red
                          : const Color(0xffE1E1E1),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                child: Visibility(
                  visible: showConfirmPasswordIdError,
                  child: const Text(
                    'Password do not match !',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFF0914),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        activeColor: const Color(0xffC01414),
                        value: isCheck,
                        onChanged: (newBool) {
                          setState(() {
                            isCheck = newBool!;
                          });
                        },
                      ),
                      const Text(
                        'I agree to ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff696F79),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'terms & conditions',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xffC01414),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ElevatedButton(
                  onPressed: _isFirstnameValid(firstNameController.text) &&
                          _isLirstnameValid(lastNameController.text) &&
                          isEmailValid(emailController.text) &&
                          isCheck &&
                          (isPasswordValid(passwordController.text) &&
                              !_isPasswordMismatch() &&
                              _isNationalIdValid(nationalIdController.text))
                      ? () async {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            await signUpMethod();
                            setState(() {
                              isLoading = false;
                            });
                          } catch (e) {
                            Fluttertoast.showToast(
                              msg: 'There is an Error, Please try again!',
                              toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
                            );

                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: const Size(342, 48),
                    backgroundColor: const Color(0xffC01414),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signUpMethod() async {
    try {
      await SignUpService(context: context).signUp(
        signUpModel: SignUpModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          ssn: nationalIdController.text,
          password: passwordController.text,
          // isConfirmed: ''
        ),
      );
    } catch (e) {
      throw Exception('Error logging in: $e');
    }
  }
}
