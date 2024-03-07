import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda_clone/Utility/helpers/helping_function.dart';
import 'package:food_panda_clone/Utility/validators/validations.dart';
import 'package:food_panda_clone/Widgets/customWidgets.dart';
import 'package:food_panda_clone/features/authentication/bloc/bloc/auth_bloc.dart';
import 'dart:developer' as dev;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String pageName = '/SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();

    double height = THelpingFunction.screenHeight(context: context);
    double width = THelpingFunction.screenWidth(context: context);
    return BlocListener(
        bloc: context.read<AuthBloc>(),
        listener: (context, state) {
          if (state is AuthLoadedState) {
            THelpingFunction.showSnackBar(context: context, message: state.msg);
          } else if (state is AuthErrorState) {
            THelpingFunction.showSnackBar(
                context: context, message: state.errorMsg);
          }
        },
        child: Scaffold(
          appBar: AppBar(
              // title: const Text('Sign Up'),
              ),
          body: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sign Up',
                    style: TextStyle(
                        fontSize: width * 0.1, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: height * 0.05,
                ),
                // TWidgets.TextFieldWidget(context: context, hint: 'First Name'),
                // TWidgets.TextFieldWidget(context: context, hint: 'Last Name'),
                Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      TWidgets.TextFieldWidget(
                        context: context,
                        hint: 'Email ',
                        controller: context.read<AuthBloc>().emailController,
                        validationFun: (value) {
                          if (TValidation.validateEmail(value) == null) {
                            return null;
                          }
                          return TValidation.validateEmail(value);
                        },
                      ),
                      TWidgets.TextFieldWidget(
                        context: context,
                        hint: 'Password',
                        controller: context.read<AuthBloc>().passwordController,
                        validationFun: (value) {
                          if (TValidation.validatePassword(value) != null) {
                            return TValidation.validatePassword(value);
                          }
                          // return null;
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an Account?'),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: width * 0.05),
                        )),
                  ],
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                // ...
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    width: width * 0.7,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(width * 0.2),
                            bottomLeft: Radius.circular(width * 0.5))),
                    // child: TWidgets.inkWellBtn(
                    //     context: context,
                    //     fun: () {},
                    //     btnText: 'Register',
                    //     color: Colors.transparent),
                    child: BlocBuilder(
                      bloc: context.read<AuthBloc>(),
                      builder: (context, state) {
                        dev.log(state.runtimeType.toString());
                        if (state is AuthLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          dev.log('>>${state.runtimeType.toString()}');

                          return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                if (globalKey.currentState?.validate() ==
                                    false) {
                                  context
                                      .read<AuthBloc>()
                                      .add(AuthInitialEvent());
                                }
                              },
                              child: Center(
                                  child: FittedBox(
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: height * 0.025,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
