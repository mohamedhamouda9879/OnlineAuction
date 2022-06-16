// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:onlineauction/layouts/home.dart';
import 'package:onlineauction/modules/login/cubit/cubit.dart';
import 'package:onlineauction/modules/login/cubit/states.dart';
import 'package:onlineauction/modules/register/register.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/components/constants.dart';
import 'package:onlineauction/shared/network/local/cache_helper.dart';
import 'package:onlineauction/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  var EmailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnlineLoginCubit(),
      child: BlocConsumer<OnlineLoginCubit, OnlineAuctionLoginStates>(
        listener: (context, state) {
          if (state is NewsLoginSucessStates) {
            if (state.signingModel.token != null) {
              print(state.signingModel.token);
              CacheHelper.saveData(
                      key: 'token', value: state.signingModel.token)
                  .then((value) {
                TOKEN = state.signingModel.token.toString();
                NavigateAndFinish(context, const HomeScreen());
              });
              showToast(
                  message: 'Successfully Login',
                  toastStates: ToastStates.SUCCESS);
            } else {
              print('hamouda');
              showToast(
                  message: "Password or Email  incorrect",
                  toastStates: ToastStates.EROOR);
            }
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: defaultColor,
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
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.asset('assets/images/logo.png'),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Text(
                            'Sign in To Your Account',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          defaultFormField(
                            controller: EmailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Email';
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
                            lines: 1,
                            isPassword:
                                OnlineLoginCubit.get(context).isPasswordShowen,
                            type: TextInputType.visiblePassword,
                            validate: (String? value) {
                              if (value!.isEmpty)
                                return 'Password is Too Short';
                              return null;
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                OnlineLoginCubit.get(context).UserLogin(
                                    email: EmailController.text,
                                    password: passwordController.text,
                                    context: context);
                              }
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
                                if (formKey.currentState!.validate()) {
                                  OnlineLoginCubit.get(context).UserLogin(
                                    email: EmailController.text,
                                    password: passwordController.text,
                                    context: context,
                                  );
                                }
                              },
                              background: Color.fromARGB(255, 239, 91, 36),
                              text: 'Sign In',
                              radius: 12.0,
                              isUpperCase: true,
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
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
                                  color: Color.fromARGB(255, 239, 91, 36),
                                  text: 'Sign Up')
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
