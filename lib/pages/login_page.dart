import 'package:flutter_application_1/bloc/auth/auth_bloc.dart';
// import 'package:flutter_application_1/pages/shopeepay.dart';
import 'package:flutter_application_1/pages/smart_building/smart_building.dart';
import 'package:flutter_application_1/visibility_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Merekam ukuran layar

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 185, 212, 244),
      body: Container(
        padding: const EdgeInsets.all(70),
        child: Row(
          children: [
            screenWidth < 600
                ? const SizedBox() //Jika ukuran screen <600, maka akan kosong
                : Expanded(
                    child: Container(
                      // Buat style di container menggunakan decoration
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: screenWidth < 600
                            ? BorderRadius.circular(20)
                            : const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome to Smart Building",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Silahkan Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Mari Mulai Aplikasi",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: screenWidth < 600
                      ? BorderRadius.circular(20)
                      : const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://64.media.tumblr.com/17cdeb5fe2f16c64e8ecf70fd08030ea/tumblr_p84nqdyXJQ1tbb76yo1_r1_500.pnj',
                      height: 200,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 100,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300, // Atur lebar form
                      height: 60, // Atur tinggi form
                      child: TextFormField(
                        controller: emailC,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10), // Persegi
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    BlocConsumer<VisibilityCubit, bool>(
                      listener: (context, state) {},
                      builder: (context, isObscured) {
                        return SizedBox(
                          width: 300, // Atur lebar form
                          height: 60, // Atur tinggi form
                          child: TextFormField(
                            controller: passC,
                            obscureText: isObscured,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Mengatur border menjadi persegi
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObscured
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  context.read<VisibilityCubit>().change();
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthEventLogin(
                                email: emailC.text,
                                password: passC.text,
                              ),
                            );
                      },
                      label: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthStateError) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(state.message),
                              duration: const Duration(seconds: 2),
                            ));
                          } else if (state is AuthStateLoaded) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SmartBuilding(),
                            ));
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthStateLoading) {
                            return const Text('Loading...',
                                style: TextStyle(
                                  fontSize: 16,
                                ));
                          }
                          return const Text(
                            'Log In Account',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                      icon: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthStateLoading) {
                            return const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                // valueColor:
                                //     AlwaysStoppedAnimation<Color>(Colors.black),
                              ),
                            );
                          }
                          return const Icon(
                            Icons.login,
                            color: Colors.black,
                          );
                        },
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent.shade100,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
