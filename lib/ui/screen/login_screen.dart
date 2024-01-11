import 'package:bowerbird_miniapp/provider/auth_provider.dart';
import 'package:bowerbird_miniapp/ui/widget/custom_textformfield.dart';
import 'package:bowerbird_miniapp/util/constant.dart';
import 'package:bowerbird_miniapp/util/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? emailInvalidMessage;
  String? passwordInvalidMessage;

  @override
  void initState() {
    // emailController.text = "jw_sum@yahoo.com";
    // passwordController.text = "jianwei321";
    super.initState();
  }

  ///
  /// return true if the form is validate
  bool validateForm() {
    setState(() {
      emailInvalidMessage = Validation.validateEmail(emailController.text);
      passwordInvalidMessage = Validation.validateEmpty(
          value: passwordController.text, fieldName: "Password");
    });

    return emailInvalidMessage == null && passwordInvalidMessage == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: PaddingConstant.defaultPadding),
              child: Text('BowerBird',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w400)),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingConstant.defaultPadding),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: PaddingConstant.doublePadding,
                    ),
                    child: Text(
                      "Log in to BowerBird",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: PaddingConstant.quarterPadding,
                    ),
                    child: Text(
                      "Email",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    validator: Validation.validateEmail,
                  ),
                  if (emailInvalidMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: PaddingConstant.quarterPadding,
                      ),
                      child: Text(
                        emailInvalidMessage!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.red,
                            ),
                      ),
                    ),
                  const SizedBox(
                    height: PaddingConstant.defaultPadding,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: PaddingConstant.quarterPadding,
                    ),
                    child: Text(
                      "Password",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                  CustomTextFormField(
                    obscureText: true,
                    maxLines: 1,
                    controller: passwordController,
                    validator: (value) => Validation.validateEmpty(
                        value: value, fieldName: "password"),
                  ),
                  if (passwordInvalidMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: PaddingConstant.quarterPadding,
                      ),
                      child: Text(
                        passwordInvalidMessage!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.red,
                            ),
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: PaddingConstant.defaultPadding,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (validateForm()) {
                          ref.read(loginProvider.notifier).login((
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()
                          ));
                        }
                      },
                      child: const Text("LOGIN"),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
