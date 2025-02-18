import 'package:country_picker/country_picker.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool isPassword;
  final bool isDropdown;
  final bool isDatePicker;
  final bool isCountryPicker;
  final List<String>? dropdownItems;
  final ValueChanged? onChanged;
  final FormFieldValidator<String>? validator;
  final ValueSetter? onSaved;

  const CustomInputField({
    super.key,
    required this.label,required this.hint,
    this.controller,this.inputType,
    this.isPassword = false,this.isDropdown = false,
    this.isDatePicker = false,this.isCountryPicker = false,
    this.dropdownItems,this.onChanged,this.validator,this.onSaved,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}
class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscurePassword = true;
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: GoogleFonts.inter(
                fontSize: SizeConfig.defaultSize! * 1.6,
                fontWeight: FontWeight.bold)),
        const VerticalSpace(0.5),
        if (widget.isCountryPicker)
          _buildCountryPicker()
        else if (widget.isDatePicker)
          _buildDatePicker()
        else if (widget.isDropdown)
          _buildDropdown()
        else
          _buildTextField(),
      ],
    );
  }
  Widget _buildTextField() {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      obscureText: widget.isPassword ? _obscurePassword : false,
      style: GoogleFonts.inter(fontSize: 16),
      validator: widget.validator,
      onSaved: widget.onSaved,
      decoration: _inputDecoration().copyWith(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility),
                onPressed: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
              )
            : null,
      ),
    );
  }
  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      decoration: _inputDecoration(),
      hint: Text(widget.hint,
          style: GoogleFonts.inter(fontSize: 14, color: Colors.grey)),
      items: ["Male", "Female"].map((item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
      onChanged: (value) {
        setState(() => _selectedValue = value);
        if (widget.onChanged != null) widget.onChanged!(value);
      },
    );
  }
  Widget _buildCountryPicker() {
    return InkWell(
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: false, // إخفاء كود الدولة إن لم يكن مطلوبًا
          onSelect: (Country country) {
            setState(() {
              _selectedValue = country.name;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(country.name);
            }
          },
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.4),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          _selectedValue ?? widget.hint,
          style: GoogleFonts.inter(
            fontSize: SizeConfig.defaultSize! * 1.4,
            color: _selectedValue != null ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
  Widget _buildDatePicker() {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          String formattedDate =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          setState(() => _selectedValue = formattedDate);
          if (widget.onChanged != null) widget.onChanged!(formattedDate);
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.4),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          _selectedValue ?? widget.hint,
          style: GoogleFonts.inter(
            fontSize: SizeConfig.defaultSize! * 1.4,
            color: _selectedValue != null ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      hintText: widget.hint,
      hintStyle: GoogleFonts.inter(
          fontSize: SizeConfig.defaultSize! * 1.4, color: Colors.grey),
    );
  }
}
