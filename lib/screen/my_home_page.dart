import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;



  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();





  String? _validatePhone(String value) {
    final phoneRegex = RegExp(r'^01[0-9]{9}$');
    if (value.isEmpty) {
      return 'Phone number is required';
    } else if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number (11 digits starting with 01)';
    }
    return null;
  }


  String? _validateEmail(String value) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }



  String? _validatePassword(String value) {
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&#]).{8,}$');
    if (value.isEmpty) {
      return 'Password is required';
    } else if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters and include uppercase, lowercase, digit, and special character';
    }
    return null;
  }

  String? _validatePassword2(String value) {
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&#]).{8,}$');
    if (value.isEmpty) {
      return 'Password is required';
    } else if (!passwordRegex.hasMatch(value) && _passwordController2 != _passwordController) {
      return 'Password must be match!';
    }
    return null;
  }






  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/pic.jpg",
              fit: BoxFit.cover,
            ),
          ),

          Container(


        padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(

          ),
          child: Form(
            key: _formKey,
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(


                  decoration: const BoxDecoration(

                  )
                  ,child:  const Text("Register Here",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),


                ),
                ),
              ],
            ),

            TextFormField(

              obscureText: false,
              controller: _nameController,
              validator: (value) => value!.isEmpty ? "Name is required" : null,

              decoration: InputDecoration(
                hintText: "Full Name",

                hintStyle:  const TextStyle(color: Colors.blue),
                prefixIcon: const Icon(Icons.person_outline, color: Colors.blue),

                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),

              ),


            ),


                      const SizedBox(height: 10,),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                        decoration: InputDecoration(
                          hintText: "Phone",
                          hintStyle: const TextStyle(color: Colors.blue),
                          prefixIcon: const Icon(Icons.phone, color: Colors.blue),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) => _validatePhone(value!),
                      ),
                    const SizedBox(height: 10,),


            TextFormField(

              validator: (value) => _validateEmail(value!),
              obscureText: false,
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email",

                hintStyle:  const TextStyle(color: Colors.blue),
                prefixIcon: const Icon(Icons.email_outlined, color: Colors.blue),

                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),

              ),


            ),
            const SizedBox(height: 10,),

            TextFormField(
              validator: (value) => _validatePassword(value!),
              obscureText: !_isPasswordVisible,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Password",

                hintStyle:  const TextStyle(color: Colors.blue),
                prefixIcon: const Icon(Icons.key_outlined, color: Colors.blue),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),

              ),


            ),
            const SizedBox(height: 10,),

            TextFormField(

              validator: (value) => _validatePassword2(value!),
              obscureText: !_isPasswordVisible,
              controller: _passwordController2,
              decoration: InputDecoration(
                hintText: "Password",

                hintStyle:  const TextStyle(color: Colors.blue),
                prefixIcon: const Icon(Icons.key_outlined, color: Colors.blue),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible; // Toggle password visibility
                    });
                  },
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),

              ),


            ),
            SizedBox(height: 10,),

            SizedBox(
              width: 200,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,


                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15), // Adjust vertical padding
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Full Name: ${_nameController.text}\n"
                        "Email: ${_emailController.text}\n"
                        "Phone: ${_phoneController.text}\n"
                        "Password: ${_passwordController.text}");
                  } else {
                    print("Validation failed");
                  }
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 18, // Text size
                    fontWeight: FontWeight.bold,
                    color: Colors.white// Bold text
                  ),
                ),
              ),
            )


                    ],
            ),
          )

      ),]
    );
  }
}
