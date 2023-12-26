import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
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
                    'Signup',
                    style: theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Enter your credentials to continue',
                    style: theme.textTheme.bodyLarge!.copyWith(),
                  ),
                ),
                const Gap(15),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('User name'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username is empty';
                    }
                    return null;
                  },
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
                      _formkey.currentState!.validate();
                    },
                    child: Text(
                      'Sign up',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                const Gap(50),
                Row(
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Log in"),
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
