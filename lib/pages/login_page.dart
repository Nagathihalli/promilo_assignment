import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../view_models/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginViewModel loginViewModel = Get.put(LoginViewModel());

  void _updateButtonState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loginViewModel.emailController.addListener(_updateButtonState);
    loginViewModel.passwordController.addListener(_updateButtonState);
  }

  bool? isChecked = false;

  @override
  void dispose() {
    loginViewModel.emailController.removeListener(_updateButtonState);
    loginViewModel.passwordController.removeListener(_updateButtonState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = loginViewModel.emailController.text.isNotEmpty &&
        loginViewModel.passwordController.text.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'promilo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text("Hi, Welcome Back!",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                const SizedBox(height: 20),
                const Text("Please Sign in to continue",
                    style: TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                Form(
                  key: loginViewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                          controller: loginViewModel.emailController,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: "Enter Email or Mob No.",
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10))),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Sign In With OTP",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.blue),
                              )),
                        ],
                      ),
                      TextFormField(
                          controller: loginViewModel.passwordController,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: "Enter Password",
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.black12)),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10))),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                  activeColor: Colors.lightBlueAccent),
                              const Text(
                                "Remember Me",
                                style: TextStyle(color: Colors.black45),
                              )
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot Password",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.blue),
                              ))
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton(
                            onPressed: isButtonEnabled
                                ? () {
                                    loginViewModel.login();
                                  }
                                : null,
                            style: isButtonEnabled
                                ? ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all<Color>(
                                        Colors.blueAccent.shade100),
                                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: const BorderSide(
                                                color: Colors.blue))))
                                : ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                            Colors.grey.shade100),
                                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: const BorderSide(color: Colors.black)))),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: isButtonEnabled
                                      ? Colors.white
                                      : Colors.black54),
                            )),
                      ),
                      Obx(() {
                        if (loginViewModel.errorMessage.isNotEmpty) {
                          // Show the SnackBar using ScaffoldMessenger
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  loginViewModel.errorMessage.value,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                            // Clear the error message after showing the SnackBar to prevent it from showing again
                            loginViewModel.errorMessage.value = '';
                          });
                        }
                        return Container(); // Or your main content
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Row(children: [
                  Expanded(
                    child: Divider(thickness: 1),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("or")),
                  Expanded(child: Divider(thickness: 1))
                ]),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Bootstrap.google, size: 40),
                    Icon(Bootstrap.linkedin, size: 40),
                    Icon(Bootstrap.facebook, size: 40),
                    Icon(Bootstrap.instagram, size: 40),
                    Icon(Bootstrap.whatsapp, size: 40)
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Business User?",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.withOpacity(0.8)),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Login Here",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 22),
                            ))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Don't have an account",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.withOpacity(0.8)),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Sign Up",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 22),
                            ))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "By Continuing, you agree to",
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                          children: [
                            TextSpan(text: "\n Promilo's"),
                            TextSpan(
                                text: " Term's of Use & Privacy Policy.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500))
                          ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
