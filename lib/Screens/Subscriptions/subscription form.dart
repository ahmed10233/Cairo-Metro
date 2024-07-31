import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metro/Screens/Subscriptions/take_user_photo.dart';
import 'package:metro/main.dart';
import 'package:metro/widgets/backIcon.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({
    super.key,
  });

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController nationalIdController = TextEditingController();

  TextEditingController birthDatecontroller = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController studentIdController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController universityNameontroller = TextEditingController();

  TextEditingController universityLevelController = TextEditingController();

  TextEditingController startStationController = TextEditingController();

  TextEditingController endStationController = TextEditingController();
    TextEditingController universitySpecializationController = TextEditingController();

  bool showFullnameError = false;
  bool showEmailError = false;
  bool showNationalIdError = false;
  bool showStudentIdError = false;
  bool showAddressError = false;
  bool obscureText = false;
  bool isCheck = false;
  bool isShow = true;
  bool isLoading = false;
  DateTime selectedDate = DateTime.now();
  bool isDateSelected = false;
  @override
  void initState() {
    super.initState();
    birthDatecontroller.text =
        "Birthdate                                                  Y/M/D";
  }

  void showDatePicker() {
    DatePicker.showDatePicker(
      context,
      maxDateTime: DateTime.now(),
      initialDateTime: selectedDate,
      onConfirm: (DateTime dateTime, List<int>? index) {
        setState(() {
          selectedDate = dateTime;
          isDateSelected = true;
          birthDatecontroller.text = "${selectedDate.toLocal()}"
              .split(' ')[0]; // Set flag to true when date is selected
        });
      },
      pickerTheme: const DateTimePickerTheme(
        backgroundColor: Colors.white,
        itemTextStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        confirmTextStyle: TextStyle(color: Colors.blue),
        cancelTextStyle: TextStyle(color: Colors.red),
        pickerHeight: 300.0,
        titleHeight: 40.0,
        itemHeight: 40.0,
      ),
    );
  }

  bool isFullnameValid(String fullName) {
    return RegExp(r'^[a-zA-Z\s]{10,50}$').hasMatch(fullName);
  }

  bool isNationalIdValid(String nationalId) {
    return nationalId.length == 14 && int.tryParse(nationalId) != null;
  }

  bool isStudentIdValid(String studentId) {
    return studentId.length == 8 && int.tryParse(studentId) != null;
  }

  bool isAddressValid(String address) {
    return RegExp(r'^[a-zA-Z0-9\s]{20,200}$').hasMatch(address);
  }

  bool isEmailValid(String email) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  bool isStartValid(String start) {
    return start.isNotEmpty;
  }

  bool isEndValid(String start) {
    return start.isNotEmpty;
  }

  bool isUniNameValid(String start) {
    return start.isNotEmpty;
  }

  bool isUniLevelValid(String start) {
    return start.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const backIcon(),
                  const Text(
                    'subscriptions',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffC01414),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Make your subscription in an easy way now',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000),
                      //fontFamily:
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextField(
                    controller: fullNameController,
                    onChanged: (fullNameController) {
                      setState(() {
                        showFullnameError =
                            !isFullnameValid(fullNameController);
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 12,
                      ),
                      hintText: "Full name like National ID ",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff2C2C2C),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: showFullnameError
                                ? Colors.red
                                : const Color(0xffE1E1E1),
                            width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: showFullnameError
                              ? Colors.red
                              : const Color(0xffE1E1E1),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                    child: Visibility(
                      visible: showFullnameError &&
                          fullNameController.text.isNotEmpty,
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
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: nationalIdController,
                    onChanged: (nationalIdController) {
                      setState(() {
                        showNationalIdError =
                            !isNationalIdValid(nationalIdController);
                      });
                    },
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          color: Colors.grey,
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
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
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    onTap: () {
                      showDatePicker();
                    },
                    controller: birthDatecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 147, 146, 146),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 12,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffE1E1E1),
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffE1E1E1),
                          width: 1.0,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 59, 59, 59),
                      fontSize: 16,
                    ),
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 30,
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
                          color: showEmailError
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
                      visible:
                          showEmailError && emailController.text.isNotEmpty,
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
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: studentIdController,
                    onChanged: (studentIdController) {
                      setState(() {
                        showStudentIdError =
                            !isStudentIdValid(studentIdController);
                      });
                    },
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          color: Colors.grey,
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
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
                      hintText: "Student ID",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff2C2C2C),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: showStudentIdError
                                ? Colors.red
                                : const Color(0xffE1E1E1),
                            width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: showStudentIdError
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
                      visible: showStudentIdError &&
                          studentIdController.text.isNotEmpty,
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
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: addressController,
                    onChanged: (addressController) {
                      setState(() {
                        showAddressError = !isAddressValid(addressController);
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 12,
                      ),
                      hintText: "Address",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff2C2C2C),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: showAddressError
                                ? Colors.red
                                : const Color(0xffE1E1E1),
                            width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: showAddressError
                              ? Colors.red
                              : const Color(0xffE1E1E1),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                    child: Visibility(
                      visible:
                          showAddressError && addressController.text.isNotEmpty,
                      child: const Text(
                        'please enter a valid Address',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFF0914),
                        ),
                      ),
                    ),
                  ),
                  DropdownMenu(
                    controller: universityNameontroller,
                    inputDecorationTheme: const InputDecorationTheme(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                      color: Color(0xffE1E1E1),
                    ))),
                    width: 400,
                    label: const Text("University Name"),
                    dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                      DropdownMenuEntry(
                          value: "Cairo university",label: "Cairo university"),
                      DropdownMenuEntry(
                          value: "Modern academy", label: "Modern academy"),
                      DropdownMenuEntry(
                          value: "Helwan university", label: "Helwan university"),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                   DropdownMenu(
                    controller: universitySpecializationController,
                    inputDecorationTheme: const InputDecorationTheme(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                      color: Color(0xffE1E1E1),
                    ))),
                    width: 400,
                    label: const Text("University Specialization"),
                    dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                      DropdownMenuEntry(
                          value: "Faculty of Physical Education",label: "Faculty of Physical Education"),
                      DropdownMenuEntry(
                          value: "Faculty of Physical Therapy", label: "Faculty of Physical Therapy"),
                      DropdownMenuEntry(
                          value: "Faculty of Science", label: "Faculty of Science"),
                          DropdownMenuEntry(
                          value: "Faculty of Social Work", label: "Faculty of Social Work"),
                          DropdownMenuEntry(
                          value: "Faculty of Literature", label: "Faculty of Literature"),
                          DropdownMenuEntry(
                          value: "Faculty of Commerce", label: "Faculty of Commerce"),
                          DropdownMenuEntry(
                          value: "Faculty of Computer Science", label: "Faculty of Computer Science"),
                          DropdownMenuEntry(
                          value: "Faculty of Dentistry", label: "Faculty of Dentistry"),
                          DropdownMenuEntry(
                          value: "Faculty of Economics & Political Science", label: "Faculty of Economics & Political Science"),
                          DropdownMenuEntry(
                          value: "Faculty of Education", label: "Faculty of Education"),
                          DropdownMenuEntry(
                          value: "Faculty of Engineering", label: "Faculty of Engineering"),
                          DropdownMenuEntry(
                          value: "Faculty of Agriculture", label: "Faculty of Agriculture"),
                          DropdownMenuEntry(
                          value: "Faculty of Applied Arts", label: "Faculty of Applied Arts"),
                          DropdownMenuEntry(
                          value: "Faculty of Archeology", label: "Faculty of Archeology"),
                          DropdownMenuEntry(
                          value: "Faculty of Artistic Education", label: "Faculty of Artistic Education"),
                          DropdownMenuEntry(
                          value: "Faculty of Fine Arts", label: "Faculty of Fine Arts"),
                          DropdownMenuEntry(
                          value: "Faculty of Foreign Languages", label: "Faculty of Foreign Languages"),
                          DropdownMenuEntry(
                          value: "Faculty of Home Economics", label: "Faculty of Home Economics"),
                          DropdownMenuEntry(
                          value: "Faculty of Law", label: "Faculty of Law"),
                          DropdownMenuEntry(
                          value: "Faculty of Mass Communications", label: "Faculty of Mass Communications"),
                          DropdownMenuEntry(
                          value: "Faculty of Medicine", label: "Faculty of Medicine"),
                          DropdownMenuEntry(
                          value: "Faculty of Musical Education", label: "Faculty of Musical Education"),
                          DropdownMenuEntry(
                          value: "Faculty of Nursing", label: "Faculty of Nursing"),
                          DropdownMenuEntry(
                          value: "Faculty of Pharmacy", label: "Faculty of Pharmacy"),
                          DropdownMenuEntry(
                          value: "Faculty of Veterinary Medicine", label: "Faculty of Veterinary Medicine"),


                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  DropdownMenu(
                    controller: universityLevelController,
                    inputDecorationTheme: const InputDecorationTheme(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                      color: Color(0xffE1E1E1),
                    ),
                    ),
                    ),
                    width: 400,
                    label: const Text("University Level"),
                    dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                      DropdownMenuEntry(label: "Level 1", value: "1"),
                      DropdownMenuEntry(label: "Level 2", value: "2"),
                      DropdownMenuEntry(label: "Level 3", value: "3"),
                      DropdownMenuEntry(label: "Level 4", value: "4"),
                      DropdownMenuEntry(label: "Level 5", value: "5"),
                      DropdownMenuEntry(label: "Level 6", value: "6"),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownMenu(
                        controller: startStationController,
                        inputDecorationTheme: const InputDecorationTheme(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                          color: Color(0xffE1E1E1),
                        ))),
                        menuHeight: 300,
                        width: 180,
                        label: const Text("Start Station"),
                        dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                          DropdownMenuEntry(label: "shubra el-kheima", value: '1'),
                          DropdownMenuEntry(label: "kolleyyet el-zeraa", value: '2'),
                          DropdownMenuEntry(label: "mezallat", value: '3'),
                          DropdownMenuEntry(label: "khalafawy", value: '4'),
                          DropdownMenuEntry(label: "st-teresa", value: '5'),
                          DropdownMenuEntry(label: "road rl-farag", value: '6'),
                          DropdownMenuEntry(label: "masarra", value: '7'),
                          DropdownMenuEntry(label: "al shohadaa", value: '8'),
                          DropdownMenuEntry(label: "attaba", value: '9'),
                          DropdownMenuEntry(label: "mohamed naguib", value: '10'),
                          DropdownMenuEntry(label: "sadat", value: '11'),
                          DropdownMenuEntry(label: "opera", value: '12'),
                          DropdownMenuEntry(label: "dokki", value: '13'),
                          DropdownMenuEntry(label: "el bohoth", value: '14'),
                          DropdownMenuEntry(label: "cairo university", value: '15'),
                          DropdownMenuEntry(label: "faisal", value: '16'),
                          DropdownMenuEntry(label: "el giza", value: '17'),
                          DropdownMenuEntry(label: "omm el-masryeen", value: '18'),
                          DropdownMenuEntry(label: "sakiat mekky", value: '19'),
                          DropdownMenuEntry(label: "el-mounib", value: '20'),
                          
                          DropdownMenuEntry(label: "Helwan", value: '21'),
                          DropdownMenuEntry(label: "Ain Helwan", value: '22'),
                          DropdownMenuEntry(label: "Helwan University", value: '23'),
                          DropdownMenuEntry(label: "Wadi Hof", value: '24'),
                          DropdownMenuEntry(label: "Hadayek Helwan", value: '25'),
                          DropdownMenuEntry(label: "El-Maasara", value: '26'),
                          DropdownMenuEntry(label: "Tora El-Asmant", value: '27'),
                          DropdownMenuEntry(label: "Kozzika", value: '28'),
                          DropdownMenuEntry(label: "Tora El-Balad", value: '29'),
                          DropdownMenuEntry(label: "Sakanat El-Maadi", value: '30'),
                          DropdownMenuEntry(label: "Maadi", value: '31'),
                          DropdownMenuEntry(label: "Hadayek El-Maadi", value: '22'),
                          DropdownMenuEntry(label: "Dar El-Salam", value: '33'),
                          DropdownMenuEntry(label: "El-Zahraa", value: '44'),
                          DropdownMenuEntry(label: "Mar Girgis", value: '35'),
                          DropdownMenuEntry(label: "El-Malek El-Saleh", value: '36'),
                          DropdownMenuEntry(label: "Al-Sayeda Zeinab", value: '37'),
                          DropdownMenuEntry(label: "Saad Zaghloul", value: '38'),
                          DropdownMenuEntry(label: "Sadat", value: '39'),
                          DropdownMenuEntry(label: "Nasser", value: '40'),
                          DropdownMenuEntry(label: "Orabi", value: '41'),
                          DropdownMenuEntry(label: "Al-Shohadaa", value: '42'),
                          DropdownMenuEntry(label: "Ghamra", value: '43'),
                          DropdownMenuEntry(label: "El-Demerdash", value: '44'),
                          DropdownMenuEntry(label: "Manshiet El-Sadr", value: '45'),
                          DropdownMenuEntry(label: "Kobri El-Qobba", value: '46'),
                          DropdownMenuEntry(label: "Hammamat El-Qobba", value: '47'),
                          DropdownMenuEntry(label: "Saray El-Qobba", value: '48'),
                          DropdownMenuEntry(label: "Hadayeq El-Zaitoun", value: '49'),
                          DropdownMenuEntry(label: "Helmeyet El-Zaitoun", value: '50'),
                          DropdownMenuEntry(label: "El-Matareyya", value: '51'),
                          DropdownMenuEntry(label: "Ain Shams", value: '52'),
                          DropdownMenuEntry(label: "Ezbet El-Nakhl", value: '53'),
                          DropdownMenuEntry(label: "El-Marg", value: '54'),
                          DropdownMenuEntry(label: "New El-Marg", value: '55'),
                         
                          
                        ],
                      ),
                      DropdownMenu(
                        controller: endStationController,
                        inputDecorationTheme: const InputDecorationTheme(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                          color: Color(0xffE1E1E1),
                        ))),
                        width: 180,
                        menuHeight: 300,
                        label: const Text("End Station"),
                        dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                          DropdownMenuEntry(label: "shubra el-kheima", value: '1'),
                          DropdownMenuEntry(label: "kolleyyet el-zeraa", value: '2'),
                          DropdownMenuEntry(label: "mezallat", value: '3'),
                          DropdownMenuEntry(label: "khalafawy", value: '4'),
                          DropdownMenuEntry(label: "st-teresa", value: '5'),
                          DropdownMenuEntry(label: "road rl-farag", value: '6'),
                          DropdownMenuEntry(label: "masarra", value: '7'),
                          DropdownMenuEntry(label: "al shohadaa", value: '8'),
                          DropdownMenuEntry(label: "attaba", value: '9'),
                          DropdownMenuEntry(label: "mohamed naguib", value: '10'),
                          DropdownMenuEntry(label: "sadat", value: '11'),
                          DropdownMenuEntry(label: "opera", value: '12'),
                          DropdownMenuEntry(label: "dokki", value: '13'),
                          DropdownMenuEntry(label: "el bohoth", value: '14'),
                          DropdownMenuEntry(label: "cairo university", value: '15'),
                          DropdownMenuEntry(label: "faisal", value: '16'),
                          DropdownMenuEntry(label: "el giza", value: '17'),
                          DropdownMenuEntry(label: "omm el-masryeen", value: '18'),
                          DropdownMenuEntry(label: "sakiat mekky", value: '19'),
                          DropdownMenuEntry(label: "el-mounib", value: '20'),

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                          DropdownMenuEntry(label: "Helwan", value: '21'),
                          DropdownMenuEntry(label: "Ain Helwan", value: '22'),
                          DropdownMenuEntry(label: "Helwan University", value: '23'),
                          DropdownMenuEntry(label: "Wadi Hof", value: '24'),
                          DropdownMenuEntry(label: "Hadayek Helwan", value: '25'),
                          DropdownMenuEntry(label: "El-Maasara", value: '26'),
                          DropdownMenuEntry(label: "Tora El-Asmant", value: '27'),
                          DropdownMenuEntry(label: "Kozzika", value: '28'),
                          DropdownMenuEntry(label: "Tora El-Balad", value: '29'),
                          DropdownMenuEntry(label: "Sakanat El-Maadi", value: '30'),
                          DropdownMenuEntry(label: "Maadi", value: '31'),
                          DropdownMenuEntry(label: "Hadayek El-Maadi", value: '22'),
                          DropdownMenuEntry(label: "Dar El-Salam", value: '33'),
                          DropdownMenuEntry(label: "El-Zahraa", value: '44'),
                          DropdownMenuEntry(label: "Mar Girgis", value: '35'),
                          DropdownMenuEntry(label: "El-Malek El-Saleh", value: '36'),
                          DropdownMenuEntry(label: "Al-Sayeda Zeinab", value: '37'),
                          DropdownMenuEntry(label: "Saad Zaghloul", value: '38'),
                          DropdownMenuEntry(label: "Sadat", value: '39'),
                          DropdownMenuEntry(label: "Nasser", value: '40'),
                          DropdownMenuEntry(label: "Orabi", value: '41'),
                          DropdownMenuEntry(label: "Al-Shohadaa", value: '42'),
                          DropdownMenuEntry(label: "Ghamra", value: '43'),
                          DropdownMenuEntry(label: "El-Demerdash", value: '44'),
                          DropdownMenuEntry(label: "Manshiet El-Sadr", value: '45'),
                          DropdownMenuEntry(label: "Kobri El-Qobba", value: '46'),
                          DropdownMenuEntry(label: "Hammamat El-Qobba", value: '47'),
                          DropdownMenuEntry(label: "Saray El-Qobba", value: '48'),
                          DropdownMenuEntry(label: "Hadayeq El-Zaitoun", value: '49'),
                          DropdownMenuEntry(label: "Helmeyet El-Zaitoun", value: '50'),
                          DropdownMenuEntry(label: "El-Matareyya", value: '51'),
                          DropdownMenuEntry(label: "Ain Shams", value: '52'),
                          DropdownMenuEntry(label: "Ezbet El-Nakhl", value: '53'),
                          DropdownMenuEntry(label: "El-Marg", value: '54'),
                          DropdownMenuEntry(label: "New El-Marg", value: '55'),
                         
                          


                        ],
                      ),
                    ],
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: ElevatedButton(
                      onPressed: isFullnameValid(fullNameController.text) &&
                              isAddressValid(addressController.text) &&
                              isEmailValid(emailController.text) &&
                              isStartValid(startStationController.text) &&
                              isEndValid(endStationController.text) &&
                              isUniNameValid(universityNameontroller.text) &&
                              isUniLevelValid(universityLevelController.text) &&
                              isStartValid(startStationController.text) &&
                              isStudentIdValid(studentIdController.text) &&
                              isCheck &&
                              (isNationalIdValid(nationalIdController.text))
                          ? () async {
                              try {
                                sharedPref.setString(
                                    "fullName", fullNameController.text);
                                sharedPref.setString(
                                    "nationalID", nationalIdController.text);
                                sharedPref.setString(
                                    "birthDate", birthDatecontroller.text);
                                sharedPref.setString(
                                    "email", emailController.text);
                                sharedPref.setString(
                                    "studentID", studentIdController.text);
                                sharedPref.setString(
                                    "adderss", addressController.text);
                                sharedPref.setString(
                                    "uniName", universityNameontroller.text);
                                sharedPref.setString(
                                    "uniLevel", universityLevelController.text);
                                sharedPref.setString(
                                    "start", startStationController.text);
                                sharedPref.setString(
                                    "end", endStationController.text);
                                    sharedPref.setString('universitySpecialization', universitySpecializationController.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UserPhoto(),
                                  ),
                                );
                              } on Exception {
                                Fluttertoast.showToast(
                                  msg: 'There is an Error',
                                  toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
                                );
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
        ));
  }
}
