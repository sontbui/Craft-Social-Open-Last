import 'package:clone_gpt/authentications/registration.dart';
import 'package:clone_gpt/main_screnn/home_screen.dart';
import 'package:clone_gpt/provider/authentication_provider.dart';
import 'package:clone_gpt/service/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class LoginScreenDraft extends StatefulWidget {
  const LoginScreenDraft({super.key});

  @override
  State<LoginScreenDraft> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenDraft> {
  TextEditingController emailOrPhoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  final RoundedLoadingButtonController buttonController =
      RoundedLoadingButtonController();

  @override
  void dispose() {
    emailOrPhoneNumberController.dispose();
    passwordController.dispose();
    buttonController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
                image: DecorationImage(
                  image: AssetImage(AssetsManager.botLogoLeft),
                  fit: BoxFit.contain,
                  // alignment: Alignment(0, 100),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Log in',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  // Email or Username field
                  FadeInUp(
                    duration: const Duration(milliseconds: 1800),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(211, 11, 11, 11),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: emailOrPhoneNumberController,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email_outlined),
                          hintText: "Email or phone number",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(200, 45, 44, 44),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Password field
                  FadeInUp(
                    duration: const Duration(milliseconds: 1800),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(211, 11, 11, 11),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        obscureText: !showPassword,
                        controller: passwordController,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: const Icon(Icons.lock_outline),
                          hintText: "Password",
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(200, 45, 44, 44),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: Icon(
                              showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color.fromARGB(255, 108, 108, 108),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Forget Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1900),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forget Password",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Login Button
                  FadeInUp(
                    duration: const Duration(milliseconds: 2000),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF295BFF),
                              Color(0xFF9B40D1),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            side: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          onPressed: () {
                            if (emailOrPhoneNumberController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors
                                  .white, // Đổi màu chữ cho phù hợp với gradient nền
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Sign Up Button
                  FadeInUp(
                    duration: const Duration(milliseconds: 2000),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 175, 104, 216),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Registration',
                          style: TextStyle(
                            color: Color(0xFF7A00F5),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Or Continue With
                  FadeInUp(
                    duration: const Duration(milliseconds: 2000),
                    child: const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Or Continue With',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Google and Facebook Buttons
                  FadeInUp(
                    duration: const Duration(milliseconds: 1900),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            AssetsManager.googleLogo,
                            width: MediaQuery.of(context).size.width / 5 - 20,
                            height: 24,
                          ),
                          label: const Text(
                            'Google',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor:
                                const Color.fromARGB(255, 238, 242, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            AssetsManager.facebookLogo,
                            width: MediaQuery.of(context).size.width / 5 - 20,
                            height: 24,
                          ),
                          label: const Text(
                            'Facebook',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor:
                                const Color.fromARGB(255, 238, 242, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
