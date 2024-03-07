import 'package:flutter/material.dart';
import 'package:food_panda_clone/services/PhoneAuthService/phoneAuthService.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});
  static const String pageName = '/PhoneAuthPage';

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  late TextEditingController _phoneController;
  late TextEditingController _otpCodeController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _otpCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text('Phone Authentication')),
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Login',
            style: TextStyle(
                color: Colors.lightBlue,
                fontSize: height * 0.05,
                fontWeight: FontWeight.w500),
          ),
// Gape
          SizedBox(
            height: height * 0.025,
          ),
          // TextFireld For Take Phone Number
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              hintText: 'Mobile Number',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width * 0.025)),
            ),
          ),
// Gape
          SizedBox(
            height: height * 0.025,
          ),

          // Button For Register This Phone And Get OTP Code To Verify
          ElevatedButton(
              onPressed: () {
                PhoneAuthService.registerPhoneNumber(
                    number: _phoneController.text.trim(),
                    context: context,
                    otpCodeController: _otpCodeController);
              },
              child: Text(
                '           Register           ',
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: height * 0.04,
                    fontWeight: FontWeight.w500),
              ))
        ]),
      ),
    );
  }
}
