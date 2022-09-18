import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:file_picker/file_picker.dart';

import '../../controllers/auth_tutor_controller.dart';



class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
  
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  
  var authTutorController = Get.put(AuthTutorController());
  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: authTutorController.firstnameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        authTutorController.firstnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.people_alt),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Firstname',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final lastNameField = TextFormField(
      autofocus: false,
      controller: authTutorController.lastnameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        authTutorController.lastnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.people_alt),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Lastname',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: authTutorController.emailTutorController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        authTutorController.emailTutorController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'E-mail',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: authTutorController.passwordTutorController,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (value) {
        authTutorController.passwordTutorController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: authTutorController.confirmPassword,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (value) {
        authTutorController.confirmPassword.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Confirm-Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final phoneField = TextFormField(
      autofocus: false,
      controller: authTutorController.phonetutorController,
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        authTutorController.phonetutorController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Phone',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: kPrimaryColors,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed:() {
          authTutorController.signUp();
        },
        child: Text('SignUp',textAlign: TextAlign.center,
        style: GoogleFonts.kanit(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,),
         ),),
    );
    
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: kPrimaryColors,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: kPrimaryLightColor,
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: Form(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: Image.asset('assets/images/logo.png',fit: BoxFit.contain,),
                  ),
                  SizedBox(height: 35),
                  firstNameField,
                  SizedBox(height: 35),
                  lastNameField,
                  SizedBox(height: 35),
                  emailField,
                  SizedBox(height: 35),
                  passwordField,
                  SizedBox(height: 35),
                  confirmPasswordField,
                  SizedBox(height: 35),
                  phoneField,
                  SizedBox(height: 15),
                  
                  ElevatedButton(onPressed: () async {
                   final results = await FilePicker.platform..pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions:['png','jpg'],
                   );

                   if (results == null) {
                     ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No file selected.'),
                        ),);
                   return null;
                     
                   }

                  //  final path = results.files.single.path!;
                  //  final fileName = results.files.single.name;

                  //  print(path);
                  //  print(fileName);
                   
                  }, child: Text('Upload File'),),
                  SizedBox(height: 15),
                  signUpButton,
                  SizedBox(height: 15),

                ],
              ),
              ),
              ),
          
          ),
          
        ),
      ),
    );
  }
}