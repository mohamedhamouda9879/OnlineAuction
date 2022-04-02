import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/modules/login/cubit/cubit.dart';
import 'package:onlineauction/modules/login/cubit/states.dart';
import 'package:onlineauction/modules/register/register.dart';
import 'package:onlineauction/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  var EmailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnlineLoginCubit(),
      child: BlocConsumer<OnlineLoginCubit, OnlineAuctionLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          child: Image.asset('assets/images/logo.jpg'),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Sign in To Your Account',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          controller: EmailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty)
                              return 'Please Enter Your Email';
                          },
                          label: 'Email',
                          prefix: Icons.email,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          lines: 1,
                          isPassword:
                              OnlineLoginCubit.get(context).isPasswordShowen,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) return 'Password is Too Short';
                          },
                          onSubmit: (value) {
                            // if (formKey.currentState!.validate()) {
                            //   NewsLoginCubit.get(context).UserLogin(
                            //       email: EmailController.text,
                            //       password: passwordController.text,
                            //       context: context);
                            // }
                          },
                          suffix: OnlineLoginCubit.get(context).sufix,
                          suffixPressed: () {
                            OnlineLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilderRec(
                          condition: true,
                          // condition: state is! OnlineAuctionLoginLoadingStates,
                          builder: (context) => defaultButton(
                            function: () {
                              // if (formKey.currentState!.validate()) {
                              //   NewsLoginCubit.get(context).UserLogin(
                              //     email: EmailController.text,
                              //     password: passwordController.text,
                              //     context: context,
                              //   );
                              // }
                            },
                            text: 'Sign In',
                            radius: 12.0,
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have An Account?'),
                            defaultTextButton(
                                function: () {
                                  NavigateTo(context, RegisterScreen());
                                },
                                text: 'Sign Up')
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
