// ignore_for_file: must_be_immutable

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:onlineauction/layouts/home.dart';
import 'package:onlineauction/modules/login/login.dart';
import 'package:onlineauction/modules/register/cubit/cubit.dart';
import 'package:onlineauction/modules/register/cubit/states.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/components/constants.dart';
import 'package:onlineauction/shared/network/local/cache_helper.dart';
import 'package:onlineauction/shared/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var FnameController = TextEditingController();
  var LnameController = TextEditingController();
  var phoneController = TextEditingController();
  var birthdayController = TextEditingController();
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
          if (state is NewsRegisterSuccessState) {
            if (state.registerModel.token != null) {
              print(state.registerModel.token);

              CacheHelper.saveData(
                      key: 'token', value: state.registerModel.token)
                  .then((value) {
                TOKEN = state.registerModel.token.toString();

                NavigateAndFinish(context, HomeScreen());
              });
              showToast(
                  message: 'Successfully Login',
                  toastStates: ToastStates.SUCCESS);
            } else {
              print('hamouda');
              print(state.registerModel.token);
              showToast(
                  message: "Wrong Sign In", toastStates: ToastStates.EROOR);
            }
          }
        }),
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: defaultColor,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
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
                              return 'please enter your Username';
                            }
                            return null;
                          },
                          label: 'Username',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: FnameController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your First Name';
                            }
                            return null;
                          },
                          label: 'First Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: LnameController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your Last Name';
                            }
                            return null;
                          },
                          label: 'Last Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your Phone';
                            }
                            return null;
                          },
                          label: 'Phone',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                            controller: birthdayController,
                            type: TextInputType.datetime,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime(1990, 8),
                                lastDate: DateTime(2030, 8),
                                initialDate: DateTime.now(),
                              ).then((value) {
                                birthdayController.text =
                                    '${value!.year}-${value.month}-${value.day} 15:22:25';
                              });
                            },
                            validate: (value) {
                              if (value!.isEmpty) {
                                return ' this time must be not null';
                              }
                              return null;
                            },
                            label: 'Birthday',
                            prefix: Icons.calendar_month),
                        const SizedBox(
                          height: 15.0,
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
                          height: 15.0,
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
                          height: 15.0,
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
                                if (formKey.currentState!.validate()) {
                                  OnlineRegisterCubit.get(context).userRegister(
                                    username: nameController.text,
                                    Fname: FnameController.text,
                                    Lname: LnameController.text,
                                    phone: phoneController.text,
                                    birthday: birthdayController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context,
                                  );
                                }
                              },
                              text: 'Sign Up',
                              isUpperCase: true,
                              radius: 12.0,
                              background: Color.fromARGB(255, 239, 91, 36)),
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
                                color: Color.fromARGB(255, 239, 91, 36),
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
