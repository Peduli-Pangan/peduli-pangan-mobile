import 'main_wrapper.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';
import '../theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Key untuk validasi form
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false; // State untuk indikator loading

  // --- Logic Login ---
  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Tampilkan loading
      });

      // Simulasi proses login ke backend
      await Future.delayed(const Duration(seconds: 2));

      // Contoh validasi sederhana (ganti dengan API call asli)
      if (_emailController.text == "test@example.com" &&
          _passwordController.text == "password123") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Berhasil!')),
        );
        // Navigasi ke halaman utama (MainWrapper)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainWrapper()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email atau password salah.')),
        );
      }

      setState(() {
        _isLoading = false; // Sembunyikan loading
      });
    }
  }

  // --- Logic Google Sign-In (Placeholder) ---
  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1)); // Simulasi
    print("Mencoba login dengan Google...");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Integrasi Google Sign-In akan datang.')),
    );
    setState(() {
      _isLoading = false;
    });
    // Di sini Anda akan mengintegrasikan paket seperti 'google_sign_in'
    // dan berkomunikasi dengan Firebase Authentication atau backend Anda.
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Ilustrasi Atas ---
                Center(
                  child: Image.asset(
                    'assets/img/login-page-image.png', // Ganti dengan path aset Anda
                    height: 200, // Sesuaikan tinggi
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 30),

                // --- Teks "Log in" ---
                Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 30),

                // --- Input Email ---
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email Address",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!value.contains('@')) {
                      return 'Masukkan email yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // --- Input Password ---
                TextFormField(
                  controller: _passwordController,
                  obscureText: true, // Untuk menyembunyikan password
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    if (value.length < 6) {
                      return 'Password minimal 6 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // --- Forgot Password ---
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage()),
                      );
                    },
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // --- Tombol Login ---
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleLogin, // Disable saat loading
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 40),

                // --- Don't have an account? Register Now ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: AppColors.textGrey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      child: Text(
                        "REGISTER NOW",
                        style: TextStyle(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // --- Or Sign Up With (Divider) ---
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or Sign up With",
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // --- Google OAuth Button ---
                Center(
                  child: GestureDetector(
                    onTap: _isLoading ? null : _handleGoogleSignIn, // Disable saat loading
                    child: Container(
                      width: 60, // Sesuaikan ukuran ikon Google
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: _isLoading 
                          ? const CircularProgressIndicator(
                              color: AppColors.primaryGreen, 
                              strokeWidth: 2,
                            )
                          : Image.asset(
                              'assets/img/google-logo.png',
                              width: 30,
                              height: 30,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50), // Spacer bawah
              ],
            ),
          ),
        ),
      ),
      // Background Wave di bawah (opsional, jika ingin mengikuti desain)
      // Anda bisa menggunakan Stack dan CustomPaint untuk gelombang ini.
      // Untuk kemudahan, saya tidak akan memasukkannya di sini dulu.
    );
  }
}