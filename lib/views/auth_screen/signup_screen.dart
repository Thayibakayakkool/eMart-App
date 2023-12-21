import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/views/auth_screen/textfield_signup.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(color: appColors),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 100,
                child: Image.network(
                    'https://imgs.search.brave.com/eU_OXjqbkkO3AVdAUwqYnvrXm5aYzU1lxdNZVTf_a1Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTEz/ODY0NDU3MC92ZWN0/b3Ivc2hvcHBpbmct/Y2FydC1pY29uLWRl/c2lnbi1jYXJ0LWlj/b24tc3ltYm9sLWRl/c2lnbi5qcGc_cz02/MTJ4NjEyJnc9MCZr/PTIwJmM9X2xUR2tT/a0o2aGE4Wk5pS0Q4/WFdWdExOeVRqUTc0/SEN1X2M0V0ZpbzI3/Zz0'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Join the eMart',
                style: TextStyle(
                    fontSize: 18,
                    color: whiteColors,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextFieldWidgetSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
