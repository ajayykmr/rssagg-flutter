import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rssagg_flutter/common/utils/snackbar.dart';
import 'package:rssagg_flutter/common/widgets/appbar.dart';
import 'package:rssagg_flutter/common/widgets/loading_indicator.dart';
import 'package:rssagg_flutter/common/widgets/text_field.dart';
import 'package:rssagg_flutter/features/posts/view/pages/posts_screen.dart';
import 'package:rssagg_flutter/theme/theme.dart';
import '../../bloc/auth_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  Future<void> _signIn(String email, String password) async {
    context
        .read<AuthBloc>()
        .add(AuthLoginRequested(email: email, password: password));
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(context, state.error);
        }
        if (state is AuthSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const PostsScreen(),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: MyAppBar(context: context, ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 53,
                ),
                const Text(
                  "Sign In",
                  style: AppTextStyle.heading1,
                ),
                const SizedBox(
                  height: 38,
                ),
                MyTextFormField(
                  title: "Email Address",
                  leadingIcon: SvgPicture.asset(
                    Assets.email,
                    colorFilter: const ColorFilter.mode(
                        AppColor.textColorSecondary, BlendMode.srcIn),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  // isPass: true,
                ),
                const SizedBox(
                  height: 21,
                ),
                MyTextFormField(
                  title: "Password",
                  leadingIcon: SvgPicture.asset(
                    Assets.lock,
                    colorFilter: const ColorFilter.mode(
                        AppColor.textColorSecondary, BlendMode.srcIn),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  // isPass: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (state is AuthLoading) {
                          } else {
                            _signIn(_emailController.text,
                                _passwordController.text);
                          }
                        },
                        child: state is AuthLoading
                            ? const LoadingIndicator()
                            : const Text("Sign In"),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 29,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "I'm a new user. ",
                      style: AppTextStyle.highlightedLabel1,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Sign Up",
                        style: AppTextStyle.highlightedLabel1.copyWith(
                          color: AppColor.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
