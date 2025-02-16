import 'package:egyptopia/core/constants.dart';
import 'package:egyptopia/core/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:egyptopia/core/utils/assets.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:go_router/go_router.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignUpState();
}

class _SignUpState extends State<SignIn> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            height: SizeConfig.screenHeight! * 0.35,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: kMainColor,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Main Content
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.defaultSize!), // Space from top

                // Logo & App Name
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        AssetsData.logo,
                        height: SizeConfig.defaultSize! * 10,
                      ),
                      Text(
                        "Egyptopia",
                        style: GoogleFonts.imFellFrenchCanonSc(
                          fontSize: SizeConfig.defaultSize! * 3,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // White Container (Form Fields)
                Container(
                  padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.defaultSize! * 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" Sign in",
                          style: GoogleFonts.imFellFrenchCanon(
                              fontSize: 30, fontWeight: FontWeight.w500)),

                      SizedBox(height: SizeConfig.defaultSize! * 2),

                      // Email Field
                      _buildInputField("Email", "Enter your email"),
                      SizedBox(height: SizeConfig.defaultSize! * 1.5),

                      // Password Field
                      _buildPasswordField(),

                      SizedBox(height: SizeConfig.defaultSize! * 2),

                      // Sign-Up Button
                      CustomGeneralButton(
                        text: "Sign in",
                        onTap: () {},
                      ),
                      SizedBox(height: SizeConfig.defaultSize!),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot password?",
                            style: GoogleFonts.inter(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey,
                              fontSize: SizeConfig.defaultSize! * 1.6,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.defaultSize!),

                      // Bottom Container (Social Logins & Sign-in Link)
                      Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "OR",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: SizeConfig.defaultSize! * 1.5),

                          // Social Icons
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildSocialIcon(
                                    AssetsData.fblogo, 40), // Increased size
                                SizedBox(
                                    width: SizeConfig.defaultSize! *
                                        2), // Increased spacing
                                _buildSocialIcon(AssetsData.google, 40),
                                SizedBox(width: SizeConfig.defaultSize! * 2),
                                _buildSocialIcon(AssetsData.twitter, 40),
                              ],
                            ),
                          ),

                          SizedBox(height: SizeConfig.defaultSize! * 1.5),

                          // Sign Up Link
                          GestureDetector(
                            onTap: () => context.go('/signup'),
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an account? ",
                                style: GoogleFonts.inter(
                                    fontSize: 16, color: Colors.grey),
                                children: [
                                  TextSpan(
                                    text: "Sign up",
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Input Field Widget with Inter Font
  Widget _buildInputField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style:
                GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextFormField(
          style: GoogleFonts.inter(fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  // Password Field Widget with Inter Font
  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password",
            style:
                GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextFormField(
          style: GoogleFonts.inter(fontSize: 16),
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            hintText: "Enter your password",
            hintStyle: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            suffixIcon: IconButton(
              icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
            ),
          ),
        ),
      ],
    );
  }

  // Social Icon Widget
  Widget _buildSocialIcon(String assetPath, double size) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: size / 2, // Adjusted radius
        backgroundColor: Colors.white,
        child:
            Image.asset(assetPath, height: size, width: size), // Set icon size
      ),
    );
  }
}
