// ignore_for_file: must_be_immutable

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/modules/login/login.dart';
import 'package:onlineauction/modules/register/cubit/cubit.dart';
import 'package:onlineauction/modules/register/cubit/states.dart';
import 'package:onlineauction/shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? compare;

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OnlineRegisterCubit(),
      child: BlocConsumer<OnlineRegisterCubit, OnlineRegisterStates>(
        listener: ((context, state) {
          // if (state is NewsRegisterSuccessState) {
          //   if (state.loginModel.token != null) {
          //     print(state.loginModel.token);
          //     print(state.loginModel.toString());
          //     CacheHelper.saveData(key: 'token', value: state.loginModel.token)
          //         .then((value) {
          //       TOKEN = state.loginModel.token.toString();
          //       USERID = state.loginModel.user!.id.toString();
          //       NavigateAndFinish(context, HomeScreen());
          //     });
          //     showToast(
          //         message: 'Successfully Login',
          //         toastStates: ToastStates.SUCCESS);
          //   } else {
          //     print('hamouda');
          //     print(state.loginModel.token);
          //     showToast(
          //         message: "Wrong Sign In", toastStates: ToastStates.EROOR);
          //   }
          // }
        }),
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.jpg',
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                          'Sign up To Your Account',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your Name';
                            }
                            return null;
                          },
                          label: 'Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            }
                            return null;
                          },
                          label: 'Email',
                          prefix: Icons.email,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          suffix: OnlineRegisterCubit.get(context).suffix,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                            compare = value;
                            return null;
                          },
                          isPassword:
                              OnlineRegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            OnlineRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          label: 'Password',
                          lines: 1,
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: rePasswordController,
                          suffix: OnlineRegisterCubit.get(context).suffix,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                            if (compare != value) {
                              return 'wrong password';
                            }
                            return null;
                          },
                          isPassword:
                              OnlineRegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            OnlineRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          label: 'RePassword',
                          lines: 1,
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilderRec(
                          condition: true,
                          //condition: state is! NewsRegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              // if (formKey.currentState!.validate()) {
                              //   OnlineRegisterCubit.get(context).userRegister(
                              //     name: nameController.text,
                              //     email: emailController.text,
                              //     password: passwordController.text,
                              //     RePassword: rePasswordController.text,
                              //     context: context,
                              //   );
                              // }
                            },
                            text: 'Sign Up',
                            isUpperCase: true,
                            radius: 12.0,
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Have An Account?'),
                            defaultTextButton(
                                function: () {
                                  NavigateTo(context, LoginScreen());
                                },
                                text: 'Sign in')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
