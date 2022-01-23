import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/resources/auth_methods.dart';
import 'package:insta_clone/responsive/mobile_screen_layout.dart';
import 'package:insta_clone/responsive/responsive.dart';
import 'package:insta_clone/responsive/web_screen_layout.dart';
import 'package:insta_clone/screens/login_screen.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/utils/global_variables.dart';
import 'package:insta_clone/utils/utils.dart';

import '../widgets/text_fields_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    //  _bioController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethod().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );

    if (res == 'success') {
      setState(() {
        _isLoading = false;
      });
      // nav to home
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(res, context);
    }
  }

  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: MediaQuery.of(context).size.width > webScreenSize
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3)
              : const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2paNURw1DBfUC5w4I3m3EoIo7vHLpWxtXCg&usqp=CAU'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 60,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(
                'assets/ig.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldInput(
                hintText: "Enter your username",
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
                isPass: false,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                hintText: "Enter your email",
                textInputType: TextInputType.text,
                textEditingController: _emailController,
                isPass: false,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                hintText: "Enter your password",
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                hintText: "Enter your bio",
                textInputType: TextInputType.text,
                textEditingController: _bioController,
                isPass: false,
              ),
              const SizedBox(
                height: 64,
              ),
              InkWell(
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text('Sign up '),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: Colors.tealAccent,
                  ),
                ),
                onTap: signUpUser,
                //       print(res);
              ),
              const SizedBox(height: 12.0),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("have an account ?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: const SizedBox(
                      child: Text(
                        "Login.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
