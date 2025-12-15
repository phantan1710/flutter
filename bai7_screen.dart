import 'package:flutter/material.dart';

class Bai7Screen extends StatefulWidget {
  const Bai7Screen({super.key});

  @override
  State<Bai7Screen> createState() => _Bai7ScreenState();
}

class _Bai7ScreenState extends State<Bai7Screen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String _nameError = '';
  String _emailError = '';
  String _passwordError = '';
  String _confirmPasswordError = '';

  void _register() {
    setState(() {
      _nameError = '';
      _emailError = '';
      _passwordError = '';
      _confirmPasswordError = '';
    });

    bool hasError = false;

    if (_nameController.text.isEmpty) {
      setState(() => _nameError = 'Vui lòng nhập họ tên');
      hasError = true;
    }

    if (_emailController.text.isEmpty) {
      setState(() => _emailError = 'Vui lòng nhập email');
      hasError = true;
    } else if (!_emailController.text.contains('@')) {
      setState(() => _emailError = 'Email không hợp lệ');
      hasError = true;
    }

    if (_passwordController.text.isEmpty) {
      setState(() => _passwordError = 'Vui lòng nhập mật khẩu');
      hasError = true;
    } else if (_passwordController.text.length < 6) {
      setState(() => _passwordError = 'Mật khẩu phải có ít nhất 6 ký tự');
      hasError = true;
    }

    if (_confirmPasswordController.text.isEmpty) {
      setState(() => _confirmPasswordError = 'Vui lòng xác nhận mật khẩu');
      hasError = true;
    } else if (_passwordController.text != _confirmPasswordController.text) {
      setState(() => _confirmPasswordError = 'Mật khẩu không khớp');
      hasError = true;
    }

    if (!hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Đăng ký thành công! Chào mừng ${_nameController.text}'),
            backgroundColor: Colors.green),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required String error,
    bool obscureText = false,
    bool showToggle = false,
    VoidCallback? onToggle,
    Function(String)? onChanged,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: error.isNotEmpty ? Colors.red : Colors.grey[300]!),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: Icon(icon, color: Colors.grey[600]),
              suffixIcon: showToggle
                  ? IconButton(
                      icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.red[400]),
                      onPressed: onToggle,
                    )
                  : null,
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            ),
            onChanged: onChanged,
          ),
        ),
        if (error.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(error,
                    style: const TextStyle(color: Colors.red, fontSize: 12))),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Đăng ký tài khoản'),
        backgroundColor: const Color(0xFF1A0A4E),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey[50],
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _nameController,
                  hint: 'Họ tên',
                  icon: Icons.person_outline,
                  error: _nameError,
                  onChanged: (_) => setState(() => _nameError = ''),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _emailController,
                  hint: 'Email',
                  icon: Icons.email_outlined,
                  error: _emailError,
                  onChanged: (_) => setState(() => _emailError = ''),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _passwordController,
                  hint: 'Mật khẩu',
                  icon: Icons.lock_outline,
                  error: _passwordError,
                  obscureText: _obscurePassword,
                  showToggle: true,
                  onToggle: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                  onChanged: (_) => setState(() => _passwordError = ''),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _confirmPasswordController,
                  hint: 'Xác nhận mật khẩu',
                  icon: Icons.lock_outline,
                  error: _confirmPasswordError,
                  obscureText: _obscureConfirmPassword,
                  showToggle: true,
                  onToggle: () => setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword),
                  onChanged: (_) => setState(() => _confirmPasswordError = ''),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A0A4E),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 3,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.login, size: 20),
                        SizedBox(width: 8),
                        Text('Đăng Ký',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
