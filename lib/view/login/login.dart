import 'package:flutter/material.dart';
import 'package:fresh_cart/view/signup/signup.dart';
import 'package:fresh_cart/view/tab_bar/tab_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final nameController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/signup.png',
                  width: Get.width * .65,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hello!',
                    style: theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'you have missed',
                    style: theme.textTheme.bodyLarge!.copyWith(),
                  ),
                ),
                const Gap(15),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Email address'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email address is empty';
                    }
                    return null;
                  },
                ),
                const Gap(15),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Password'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is empty';
                    }
                    return null;
                  },
                ),
                const Gap(24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                    ),
                    onPressed: () {
                      // _formkey.currentState!.validate();
                      Get.to(() => const TabBarControlView());
                    },
                    child: Text(
                      'Login',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                const Gap(50),
                Row(
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const SignupView());
                      },
                      child: const Text("Signup"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
