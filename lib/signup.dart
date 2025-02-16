import 'package:egyptopia/core/constants.dart';
import 'package:egyptopia/core/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:egyptopia/core/utils/assets.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:go_router/go_router.dart';
import 'package:csc_picker/csc_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscurePassword = true;
  String? _selectedGender;
  String? _selectedCountry;
  DateTime? _selectedDate;

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
            child: SingleChildScrollView(
              child: Column(children: [
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

                SizedBox(height: SizeConfig.defaultSize! * 2),

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
                      Text(" Sign up",
                          style: GoogleFonts.imFellFrenchCanon(
                              fontSize: 30, fontWeight: FontWeight.w500)),

                      SizedBox(height: SizeConfig.defaultSize! * 2),

                      // Full Name Field
                      _buildInputField("Full Name", "Enter your name"),
                      SizedBox(height: SizeConfig.defaultSize! * 1.5),

                      // Email Field
                      _buildInputField("Email", "Enter your email"),
                      SizedBox(height: SizeConfig.defaultSize! * 1.5),

                      // Password Field
                      _buildPasswordField(),
                      SizedBox(height: SizeConfig.defaultSize! * 2),

                      // Country Picker and Date of Birth Picker in Row
                      Row(
                        children: [
                          // Country Picker
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Country",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: CSCPicker(
                                    onCountryChanged: (value) {
                                      setState(() => _selectedCountry = value);
                                    },
                                    showStates: false,
                                    showCities: false,
                                    dropdownDecoration: BoxDecoration(
                                      color: Colors.grey[200],
                                    ),
                                    dropdownItemStyle: GoogleFonts.inter(
                                      color: Colors.grey[
                                          800], // Dropdown item text color
                                    ),
                                    disabledDropdownDecoration: BoxDecoration(
                                      color: Colors.grey[200],
                                    ),
                                    selectedItemStyle: GoogleFonts.inter(
                                      color: Colors
                                          .grey, // Selected item text color
                                    ),
                                    countryDropdownLabel:
                                        "Select Country", // Default hint text
                                    dropdownHeadingStyle: GoogleFonts.inter(
                                      color:
                                          Colors.grey[600], // Hint text color
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                              width: SizeConfig.defaultSize! *
                                  3), // Spacing between elements

                          // Date of Birth Picker
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Date Of Birth",
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 5),
                                InkWell(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    );
                                    if (pickedDate != null) {
                                      setState(
                                          () => _selectedDate = pickedDate);
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      _selectedDate == null
                                          ? "Select Date Of Birth"
                                          : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                                      style: GoogleFonts.inter(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: SizeConfig.defaultSize! * 1.5),

                      // Gender Dropdown
                      Text("Gender",
                          style: GoogleFonts.inter(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          hintStyle: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        value: _selectedGender,
                        hint: Text("Select Gender",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.grey,
                            )),
                        onChanged: (String? value) {
                          setState(() => _selectedGender = value);
                        },
                        items: ["Male", "Female", "Other"].map((gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: SizeConfig.defaultSize! * 2),

                      // Sign-Up Button
                      CustomGeneralButton(
                        text: "Sign up",
                        onTap: () {},
                      ),
                      SizedBox(height: SizeConfig.defaultSize! * 2),

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
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildSocialIcon(AssetsData.fblogo, 40),
                                SizedBox(width: SizeConfig.defaultSize! * 2),
                                _buildSocialIcon(AssetsData.google, 40),
                                SizedBox(width: SizeConfig.defaultSize! * 2),
                                _buildSocialIcon(AssetsData.twitter, 40),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.defaultSize! * 1.5),
                          GestureDetector(
                            onTap: () => context.go('/signin'),
                            child: RichText(
                              text: TextSpan(
                                text: "Already have an account? ",
                                style: GoogleFonts.inter(
                                    fontSize: 16, color: Colors.grey),
                                children: [
                                  TextSpan(
                                    text: "Sign in",
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
              ]),
            ))
      ],
    ));
  }

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

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password",
            style:
                GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextFormField(
          obscureText: _obscurePassword,
          style: GoogleFonts.inter(fontSize: 16),
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
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
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
