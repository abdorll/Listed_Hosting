import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lister_hosting/utils/color.dart';

class InpiutField extends StatelessWidget {
  const InpiutField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Container(
        decoration: BoxDecoration(
            color: ash2,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: TextFormField(
            onChanged: (e) {},
            cursorColor: orange1,
            keyboardType: TextInputType.text,

            //keyboardAppearance: ,
            style: GoogleFonts.mulish(),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: 'Enter Manually',
                contentPadding: const EdgeInsets.only(top: 10),
                hintStyle: GoogleFonts.poppins(fontSize: 12),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: white),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: white),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: white),
                    borderRadius: const BorderRadius.all(Radius.circular(10)))),
          ),
        ),
      ),
    );
  }
}
