import 'package:flutter/material.dart';
import 'package:medinavi/l10n/app_localizations.dart';
import 'package:medinavi/services/auth_services.dart';
import 'package:medinavi/widgets/login_screen_setting.dart';
import 'package:medinavi/screens/main_navigation_screen.dart';

class SignUpScreen
    extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState
    extends State<SignUpScreen> {
  var _isLogin = true;
  final _formKey =
      GlobalKey<FormState>();

  //Controllers
  final _emailController =
      TextEditingController();
  final _passwordController =
      TextEditingController();
  final _confirmController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!
        .validate()) {
      final email =
          _emailController.text;
      final password =
          _passwordController.text;

      try {
        if (_isLogin) {
          await authServices.value
              .signIn(
                email: email,
                password: password,
              );

          // Check if widget is still mounted before using context
          if (mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(
                    context,
                  )!.loginAs(email),
                ),
                //backgroundColor: Colors.green,
              ),
            );

            // Navigate to MainNavigationScreen after successful login
            Navigator.of(
              context,
            ).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    const MainNavigationScreen(),
              ),
            );
          }
        } else {
          await authServices.value
              .createAccount(
                email: email,
                password: password,
              );

          // Check if widget is still mounted before using context
          if (mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(
                    context,
                  )!.signedUpAs(email),
                ),
                //backgroundColor: Colors.green,
              ),
            );

            // Navigate to MainNavigationScreen after successful sign up
            Navigator.of(
              context,
            ).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    const MainNavigationScreen(),
              ),
            );
          }
        }
      } catch (e) {
        // Handle errors
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(
            SnackBar(
              content: Text(
                e.toString(),
              ),
              backgroundColor:
                  Colors.red,
            ),
          );
        }
      }

      //Clear Fields
      _emailController.clear();
      _passwordController.clear();
      _confirmController.clear();
    }
  }

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
    });

    //Clear Previous input when toggeling
    _emailController.clear();
    _passwordController.clear();
    _confirmController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: SizedBox(),
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primary,
        title: Center(
          child: Image.asset(
            'assets/images/medinavi.png',
            width: 70,
            height: 70,
            color: Colors.white,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(
                    context,
                  ).openEndDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              );
            },
          ),
        ],
      ),
      endDrawer: LoginScreenSetting(),

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Text(
              _isLogin
                  ? AppLocalizations.of(
                      context,
                    )!.login
                  : AppLocalizations.of(
                      context,
                    )!.signUp,
              style: TextStyle(
                fontWeight:
                    FontWeight.bold,
                fontSize: 35,
              ),
            ),
            SizedBox(height: 5),

            Card(
              margin:
                  const EdgeInsets.all(
                    20,
                  ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(
                  20,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize:
                        MainAxisSize
                            .min,
                    children: [
                      TextFormField(
                        controller:
                            _emailController,
                        decoration: InputDecoration(
                          labelText:
                              AppLocalizations.of(
                                context,
                              )!.emailAddress,
                          border:
                              OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType
                                .emailAddress,
                        autocorrect:
                            false,
                        textCapitalization:
                            TextCapitalization
                                .none,
                        validator: (value) {
                          if (value ==
                                  null ||
                              value
                                  .isEmpty) {
                            return AppLocalizations.of(
                              context,
                            )!.enterEmail;
                          }
                          if (!RegExp(
                            r'^\S+@\S+\.\S+$',
                          ).hasMatch(
                            value,
                          )) {
                            return AppLocalizations.of(
                              context,
                            )!.invalidEmail;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        controller:
                            _passwordController,
                        decoration: InputDecoration(
                          labelText:
                              AppLocalizations.of(
                                context,
                              )!.password,
                          border:
                              OutlineInputBorder(),
                        ),
                        autocorrect:
                            false,
                        textCapitalization:
                            TextCapitalization
                                .none,
                        obscureText:
                            true,
                        validator: (value) {
                          if (value ==
                                  null ||
                              value
                                  .isEmpty) {
                            return AppLocalizations.of(
                              context,
                            )!.enteredPasswordMessage;
                          }
                          if (value
                                  .trim()
                                  .length <
                              6) {
                            return AppLocalizations.of(
                              context,
                            )!.enteredPasswordErrorMessage;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      if (!_isLogin)
                        TextFormField(
                          controller:
                              _confirmController,
                          decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(
                                  context,
                                )!.confirmPassword,
                            border:
                                OutlineInputBorder(),
                          ),
                          autocorrect:
                              false,
                          textCapitalization:
                              TextCapitalization
                                  .none,
                          obscureText:
                              true,
                          validator: (value) {
                            if (value ==
                                    null ||
                                value
                                    .isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.confirmPasswordMessage;
                            }
                            if (value !=
                                _passwordController
                                    .text) {
                              return AppLocalizations.of(
                                context,
                              )!.confirmPasswordErrorMessage;
                            }
                            return null;
                          },
                        ),
                      SizedBox(
                        height: 40,
                      ),

                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(
                              fixedSize:
                                  Size(
                                    200,
                                    50,
                                  ),
                            ),
                        onPressed:
                            _submit,
                        child: Text(
                          _isLogin
                              ? AppLocalizations.of(
                                  context,
                                )!.login
                              : AppLocalizations.of(
                                  context,
                                )!.signUp,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),

                      TextButton(
                        onPressed:
                            _toggleForm,
                        child: Text(
                          _isLogin
                              ? AppLocalizations.of(
                                  context,
                                )!.newSignUp
                              : AppLocalizations.of(
                                  context,
                                )!.oldLogin,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
